package com.niit.Backend.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class MultiPartController {

	public static void upload(String path,MultipartFile file,String filename)
	{
		if(!file.isEmpty())
		{
			InputStream inputStream=null;
			OutputStream outputStream=null;
			if(file.getSize()>0)
			{
				try
				{
					inputStream=file.getInputStream();
					outputStream=new FileOutputStream(path+filename);
					int readBytes=0;
					byte[] buffer= new byte[1024];
					while((readBytes=inputStream.read(buffer,0,1024))!=-1)
					{
						outputStream.write(buffer, 0, readBytes);
					}
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
				finally 
				{
					try
					{
						outputStream.close();
						inputStream.close();
					}
					catch (Exception e)
					{
						e.printStackTrace();
					}
				}
			}
		}
	}
	public static void deleteimage(String path,String filename)
	{
		if (Files.exists(Paths.get(path+ filename))) {
			try {
				Files.delete(Paths.get(path + filename));

			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("File unable to delete", e);
			}
		}
	}
}
