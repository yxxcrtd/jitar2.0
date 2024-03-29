// Copyright (c) Corporation for National Research Initiatives
package cn.edustar.jitar.jython;
import org.python.core.*;
import java.util.*;

/**
 * The PythonInterpreter class is a standard wrapper for a Jython
 * interpreter for use embedding in a Java application.
 *
 * JitarPythonInterpreter 改进了原来的 PythonInterpreter, 其能够支持 encoding,
 *   globals 等自定义设置.
 * @author  Jim Hugunin
 * @version 1.0, 02/23/97
 */
public class JythonInterpreter {
    protected PyModule module;
    protected PySystemState systemState;
    protected PyObject locals;
    protected CompilerFlags cflags = null;

    /**
     * Initializes the jython runtime. This should only be called once, and
     * should be called before any other python objects are created (including a
     * PythonInterpreter).
     * 
     * @param preProperties
     *            A set of properties. Typically System.getProperties() is used.
     * @param postProperties
     *            An other set of properties. Values like python.home,
     *            python.path and all other values from the registry files can
     *            be added to this property set. PostProperties will override
     *            system properties and registry properties.
     * @param argv
     *            Command line argument. These values will assigned to sys.argv.
     */
    public static void initialize(Properties preProperties,
                                  Properties postProperties,
                                  String[] argv) {
        PySystemState.initialize(preProperties, postProperties, argv);
    }

    /**
     * Create a new Interpreter with an empty dictionary
     */
    public JythonInterpreter() {
        this(null, null);
    }

    /**
     * Create a new interpreter with the given dictionary to use as its
     * namespace
     *
     * @param dict      the dictionary to use
     */

    // Optional dictionary willl be used for locals namespace
    public JythonInterpreter(PyObject dict) {
        this(dict, null);
    }

    public JythonInterpreter(PyObject dict, PySystemState systemState) {
        if (dict == null)
            dict = new PyStringMap();
        if (systemState == null) {
            systemState = Py.getSystemState();
            if (systemState == null)
                systemState = new PySystemState();
        }
        this.module = new PyModule("main", dict);
        this.systemState = systemState;
        this.locals = module.__dict__;
        this.cflags = new CompilerFlags();
        this.cflags.encoding = "utf-8";			// 缺省文件编码模式设置为 utf-8.       
        setState();
    }

    protected void setState() {
        Py.setSystemState(systemState);
    }

    /**
     * Set the Python object to use for the standard output stream
     *
     * @param outStream Python file-like object to use as output stream
     */
    public void setOut(PyObject outStream) {
        systemState.stdout = outStream;
    }

    /**
     * Set a java.io.Writer to use for the standard output stream 孟宪会修改 新的版本要求是OutputStream类型
     *
     * @param outStream Writer to use as output stream
     */
  
    public void setOut(java.io.Writer outStream) {
        setOut(new PyFile(new WriterOutputStream(outStream)));
    }


    /**
     * Set a java.io.OutputStream to use for the standard output stream
     *
     * @param outStream OutputStream to use as output stream
     */
    public void setOut(java.io.OutputStream outStream) {
        setOut(new PyFile(outStream));
    }

    public void setErr(PyObject outStream) {
        systemState.stderr = outStream;
    }

    public void setErr(java.io.Writer outStream) {
        setErr(new PyFile(new WriterOutputStream( outStream)));
    }

    public void setErr(java.io.OutputStream outStream) {
        setErr(new PyFile(outStream));
    }

    /**
     * Evaluate a string as Python source and return the result
     *
     * @param s the string to evaluate
     */
    public PyObject eval(String s) {
        setState();
        return __builtin__.eval(new PyString(s), locals);
    }

    /**
     * Execute a string of Python source in the local namespace
     *
     * @param s the string to execute
     */
   
    public void exec(String s) {
        setState();
        Py.exec(Py.compile_flags(s, "<string>", CompileMode.exec,cflags),locals, locals);
    }
    
    public void exec(String s, PyObject globals) {
       setState();
       Py.exec(Py.compile_flags(s, "<string>", CompileMode.exec  ,cflags),globals, locals);
   }

    /**
     * Execute a Python code object in the local namespace
     *
     * @param code the code object to execute
     */
    public void exec(PyObject code) {
        setState();
        Py.exec(code, locals, locals);
    }

    /**
     * Execute a file of Python source in the local namespace
     *
     * @param s the name of the file to execute
     */
    public void execfile(String s) {
        setState();
        __builtin__.execfile_flags(s, locals, locals, cflags);
    }

    public void execfile(java.io.InputStream s) {
        execfile(s, "<iostream>");
    }

 
    public void execfile(java.io.InputStream s, String name) {
        setState();
        Py.runCode(Py.compile_flags(s, name,CompileMode.exec,cflags), locals, locals);
    }

    // Getting and setting the locals dictionary
    public PyObject getLocals() {
        return locals;
    }

    public void setLocals(PyObject d) {
        locals = d;
    }

    /**
     * Set a variable in the local namespace
     *
     * @param name      the name of the variable
     * @param value the value to set the variable to.
     Will be automatically converted to an appropriate Python object.
    */
    public void set(String name, Object value) {
        locals.__setitem__(name.intern(), Py.java2py(value));
    }

    /**
     * Set a variable in the local namespace
     *
     * @param name      the name of the variable
     * @param value the value to set the variable to
     */
    public void set(String name, PyObject value) {
        locals.__setitem__(name.intern(), value);
    }


    /**
     * Get the value of a variable in the local namespace
     *
     * @param name      the name of the variable
     */
    public PyObject get(String name) {
        return locals.__finditem__(name.intern());
    }

    /**
     * Get the value of a variable in the local namespace Value will be
     * returned as an instance of the given Java class.
     * <code>interp.get("foo", Object.class)</code> will return the most
     * appropriate generic Java object.
     *
     * @param name      the name of the variable
     * @param javaclass the class of object to return
     */
    @SuppressWarnings({ "deprecation", "unchecked" })
	public Object get(String name, Class javaclass) {
        return Py.tojava(locals.__finditem__(name.intern()), javaclass);
    }

    public void cleanup() {
        systemState.callExitFunc();
    }
}
