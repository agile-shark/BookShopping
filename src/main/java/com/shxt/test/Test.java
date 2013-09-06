package com.shxt.test;

public class Test {
	public static void main(String args[]){
		String str = "胡锦涛同志真是个好同志啊，和梁永星一样兢兢业业!";
		DoFilter filter = new DoFilter();
		String s = filter.getStr(str);
		System.out.println(s);
	}
}
