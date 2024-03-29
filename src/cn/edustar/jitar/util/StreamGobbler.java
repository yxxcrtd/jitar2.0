package cn.edustar.jitar.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

/**
 * 进程执行
 */
public class StreamGobbler extends Thread {
	InputStream is;
	String type;
	OutputStream os;

	public StreamGobbler(InputStream is, String type) {
		this(is, type, null);
	}

	public StreamGobbler(InputStream is, String type, OutputStream redirect) {
		this.is = is;
		this.type = type;
		this.os = redirect;
	}

	@Override
	public void run() {
		try {
			PrintWriter pw = null;
			if (null != os) {
				pw = new PrintWriter(os);
			}

			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String line = null;
			while (null != (line = br.readLine())) {
				if (null != pw) {
					pw.println(line);
				}
				// System.out.println(type + ">" + line);
			}
			if (pw != null) {
				pw.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}