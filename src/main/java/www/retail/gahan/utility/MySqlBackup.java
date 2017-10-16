package www.retail.gahan.utility;

import java.util.Date;

public class MySqlBackup {

	public void backupDB(){
		 String today = DateFormate.dateToString(new Date());
		 System.out.println("Todays Date from MySqlBackup : " +today );
	    //String executeCmd = "G:/Program Files/MySQL/MySQL Server 5.7/bin/mysqldump -u root -proot -B gahan -r G:/gahan_backup/backup_1.sql";
	    String executeCmd = "mysqldump --databases -h localhost -u root -proot gahan > G:\\gahan_backup\\backup-"+today+".sql";
	    
	    Process runtimeProcess;
	  
	    try
	    {
	       runtimeProcess = Runtime.getRuntime().exec(new String[] { "C:\\Windows\\System32\\cmd.exe", "/C", executeCmd });
	 
	       int processComplete = runtimeProcess.waitFor();
	 
	       System.out.println(processComplete);
	 
	       if(processComplete == 0)
	       {
	          System.out.println("Backup Created Successfully !");
	       }
	       else
	       {
	          System.out.println("Couldn't Create the backup !");
	       }
	    }
	    catch(Exception ex)
	    {
	       ex.printStackTrace();
	    }
	 
	   }
}
