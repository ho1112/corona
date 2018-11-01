package com.sesoc.cl.vo;

import java.util.List;

public class Task_Answers {
	private List<String> input_answer;
	private List<String> output_answer;
	
	public Task_Answers() {
		
	}

	public Task_Answers(List<String> input_answer, List<String> output_answer) {
		super();
		this.input_answer = input_answer;
		this.output_answer = output_answer;
	}


	public List<String> getInput_answer() {
		return input_answer;
	}

	public void setInput_answer(List<String> input_answer) {
		this.input_answer = input_answer;
	}

	public List<String> getOutput_answer() {
		return output_answer;
	}

	public void setOutput_answer(List<String> output_answer) {
		this.output_answer = output_answer;
	}
	
	

}
