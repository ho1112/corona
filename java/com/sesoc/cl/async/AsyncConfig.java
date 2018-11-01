package com.sesoc.cl.async;

import java.lang.reflect.Method;
import java.util.concurrent.Executor;

import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

/**
 * 멀티 쓰레드의 설정을 관리하는 클래스
 * @author LSY
 */
@Configuration
@EnableAsync
public class AsyncConfig  implements AsyncConfigurer {
	/** Thread */
    private static ThreadPoolTaskExecutor EXECUTOR;
    /** 기본 Thread 수 */
    private static int TASK_SMLT_CORE_POOL_SIZE = 10;
    /** 최대 Thread 수 */
    private static int TASK_SMLT_MAX_POOL_SIZE = 20;
    /** QUEUE 수 */
    private static int TASK_SMLT_QUEUE_CAPACITY = 0;

    /**
     * Thread 생성
     * @return EXECUTOR ThreadPool의 실행자
     */
    @Bean(name = "executorSmlt")
    @Override
    public Executor getAsyncExecutor() {
    	//ThreadPool의 실행자 생성
        EXECUTOR = new ThreadPoolTaskExecutor();
        //기본 Thread 수 설정
        EXECUTOR.setCorePoolSize(TASK_SMLT_CORE_POOL_SIZE);
        //최대 Thread 수 설정
        EXECUTOR.setMaxPoolSize(TASK_SMLT_MAX_POOL_SIZE);
        //QUEUE 수 설정
        EXECUTOR.setQueueCapacity(TASK_SMLT_QUEUE_CAPACITY);
        //실행자의 Bean 이름 설정
        EXECUTOR.setBeanName("executorSmlt");
        EXECUTOR.initialize();
        return EXECUTOR;
    }
 
    /**
     * Thread 등록 가능 여부 확인
     * @return 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
     */
    public static boolean isTaskExecute() {
        boolean rtn = true;
 
        // 실행중인 task 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if (EXECUTOR.getActiveCount() >= (TASK_SMLT_MAX_POOL_SIZE + TASK_SMLT_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }
 
    /**
     * Thread 등록 가능 여부
     * @param createCnt : 생성 개수
     * @return 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크거나 같으면 false
     */
    public static boolean isTaskExecute(int createCnt) {
        boolean rtn = true;
 
        // 실행중인 task 개수 + 실행할 개수가 최대 개수(max + queue)보다 크거나 같으면 false
        if ((EXECUTOR.getActiveCount() + createCnt) >= (TASK_SMLT_MAX_POOL_SIZE + TASK_SMLT_QUEUE_CAPACITY)) {
            rtn = false;
        }
 
        return rtn;
    }

	@Override
	public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
		return new AsyncUncaughtExceptionHandler() {
			@Override
			public void handleUncaughtException(Throwable ex, Method method, Object... params) {}
		};
	}

}
