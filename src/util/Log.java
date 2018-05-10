package util;

/**
 * ��־
 */
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class Log {

	public void addLog(String str){
		try {
			File file=new File("c://log.txt");
			FileWriter fw=new FileWriter(file,true);
			BufferedWriter bw=new   BufferedWriter(fw);
			PrintWriter   pw   =   new   PrintWriter(bw);   
			pw.write(str);
			bw.newLine();//����
			bw.flush();//�����ݸ������ļ�
			pw.close();
			fw.close();//�ر��ļ���
		} catch (FileNotFoundException e) {
			System.out.println("���棺��־�ļ�û�ҵ���������");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("���棺��־�ļ�IO���󣡣�����");
			e.printStackTrace();
		}
	}
}

