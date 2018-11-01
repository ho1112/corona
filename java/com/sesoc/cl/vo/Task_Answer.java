package com.sesoc.cl.vo;

public class Task_Answer {
	private int num;
	private int task_num;
	private String input_answer;
	private String output_answer;
	
	public Task_Answer() {
		
	}

	public Task_Answer(int num, int task_num, String input_answer, String output_answer) {
		super();
		this.num = num;
		this.task_num = task_num;
		this.input_answer = input_answer;
		this.output_answer = output_answer;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getTask_num() {
		return task_num;
	}

	public void setTask_num(int task_num) {
		this.task_num = task_num;
	}

	public String getInput_answer() {
		return input_answer;
	}

	public void setInput_answer(String input_answer) {
		this.input_answer = input_answer;
	}

	public String getOutput_answer() {
		return output_answer;
	}

	public void setOutput_answer(String output_answer) {
		this.output_answer = output_answer;
	}

	@Override
	public String toString() {
		return "Task_Answer [num=" + num + ", task_num=" + task_num + ", input_answer=" + input_answer
				+ ", output_answer=" + output_answer + "]";
	}
	
	

}
