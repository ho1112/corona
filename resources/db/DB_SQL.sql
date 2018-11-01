
/* Create Tables */


drop sequence class_user_seq;
drop table class_user;
drop sequence passed_lesson_seq;
drop table passed_lesson;
drop sequence drive_file_seq;
drop table drive_file;
drop sequence drive_seq;
drop table drive;
drop sequence task_answer_seq;
drop table task_answer;
drop sequence task_submit_seq;
drop table task_submit;
drop sequence task_seq;
drop table task;
drop table users;
drop sequence board_file_seq;
drop table board_file;
drop sequence board_reply_seq;
drop table board_reply;
drop sequence board_seq;
drop table board;
drop sequence class_info_seq;
drop table class_info;


CREATE TABLE board
(
	-- 게시물의 관리 번호
	num number NOT NULL,
	-- 반의 관리 번호
	class_num number NOT NULL,
	-- 회원은 id
	user_id varchar2(20) NOT NULL,
	-- 게시물의 제목
	title varchar2(100) NOT NULL,
	-- 게시물의 내용
	content varchar2(4000) NOT NULL,
	-- 게시물 등록 시간
	register_time date DEFAULT sysdate NOT NULL,
	-- 게시물 조회수
	hit number DEFAULT 0 NOT NULL,
	reply_count number DEFAULT 0 NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE board_seq;

CREATE TABLE board_file
(
	-- 시퀀스
	num number NOT NULL,
	-- 오리지날 파일네임
	original_filename varchar2(300) NOT NULL,
	-- 저장된 이름
	saved_filename varchar2(400) NOT NULL,
	-- 게시물의 관리 번호
	bf_num number NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE board_file_seq;



CREATE TABLE board_reply
(
	-- 댓글의 관리 번호
	num number NOT NULL,
	-- 게시물의 관리 번호
	board_num number NOT NULL,
	-- 댓글 작성 회원의 id
	user_id varchar2(20) NOT NULL,
	-- 댓글의 내용
	content varchar2(2000) NOT NULL,
	-- 대댓글의 부모 댓글의 관리 번호
	parent number DEFAULT 0 NOT NULL,
	-- 댓글 등록 시간
	register_time date DEFAULT sysdate NOT NULL,
	-- 대댓글의 순서
	depth number DEFAULT 0 NOT NULL,
	-- 전체 댓글의 순서
	reorder number DEFAULT 1 NOT NULL,
	PRIMARY KEY (num)
);


CREATE SEQUENCE board_reply_seq;

CREATE TABLE class_info
(
	-- 반의 관리 번호
	num number NOT NULL,
	-- 반의 이름
	name varchar2(100) NOT NULL UNIQUE,
	-- 선생님의 id
	teacher_id varchar2(20) NOT NULL,
	-- 공개 허용 유무 (검색 가능 유무)
	is_public char(1) DEFAULT 'y' NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE class_info_seq;


CREATE TABLE class_user
(
	-- 반의 학생 관리 번호
	num number NOT NULL,
	-- 반의 관리 번호
	class_num number NOT NULL,
	-- 학생의 id
	user_id varchar2(20) NOT NULL,
	-- 반 학생의 상태(request, student, withdraw)
	status varchar2(20) DEFAULT 'request' NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE class_user_seq;

CREATE TABLE drive
(
	-- 반의 관리 번호
	class_num number NOT NULL,
	-- 자료실의 관리 번호
	num number NOT NULL,
	-- 자료물 등록 회원의 id
	user_id varchar2(20) NOT NULL,
	-- 자료물의 제목
	title varchar2(100) NOT NULL,
	-- 자료물의 내용
	content varchar2(4000) NOT NULL,
	-- 자료물 등록 시간
	register_time date DEFAULT sysdate NOT NULL,
	-- 자료물 조회수
	hit number NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE drive_seq;

CREATE TABLE drive_file
(
	-- drive_file 시퀀스 번호
	num number NOT NULL,
	-- original 파일 이름
	original_filename varchar2(300) NOT NULL,
	-- 이름 변경된 파일 이름
	saved_filename varchar2(400) NOT NULL,
	-- 자료실의 관리 번호
	drive_num number NOT NULL,
	-- 다운로드 수
	down_count number DEFAULT 0 NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE drive_file_seq;

CREATE TABLE passed_lesson
(
	-- 지난 강의의 관리 번호
	num number NOT NULL,
	-- 반의 관리 번호
	class_num number NOT NULL,
	-- 강의 이름
	title varchar2(100) NOT NULL,
	-- 업로드 시간
	savetime date DEFAULT sysdate NOT NULL,
	-- 업로드 코드의 파일이름
	saved_code varchar2(400) NOT NULL,
	-- 업로드 음성의 파일이름
	saved_audio varchar2(400) NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE passed_lesson_seq;

CREATE TABLE task
(
	-- 과제의 관리 번호
	num number NOT NULL,
	-- 반의 관리 번호
	class_num number NOT NULL,
	-- 과제의 제목
	title varchar2(100) NOT NULL,
	-- 과제의 내용
	content varchar2(4000) NOT NULL,
	-- 과제 파일의 파일 이름
	question_file varchar2(400) NOT NULL,
	-- 과제의 마감 기간
	deadline date DEFAULT sysdate NOT NULL,
	-- 과제의 마감 유무
	is_closed char(1) DEFAULT 'n' NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE task_seq;

CREATE TABLE task_answer
(
	-- 과제의 답의 관리 번호
	num number NOT NULL,
	-- 과제의 관리 번호
	task_num number NOT NULL,
	-- 입력 값
	input_answer varchar2(100) NOT NULL,
	-- 출력값
	output_answer varchar2(100) NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE task_answer_seq;

CREATE TABLE task_submit
(
	-- 과제 제출의 관리 번호
	num number NOT NULL,
	-- 과제의 관리 번호
	task_num number NOT NULL,
	-- 회원은 id
	user_id varchar2(20) NOT NULL,
	-- 과제 제출 파일의 파일이름
	submit_file varchar2(400) NOT NULL,
	-- 과제 제출 시간
	submit_time date DEFAULT sysdate NOT NULL,
	PRIMARY KEY (num)
);

CREATE SEQUENCE task_submit_seq;

CREATE TABLE users
(
	-- 회원의 id
	id varchar2(20) NOT NULL,
	-- 회원의 비밀번호
	password varchar2(30) NOT NULL,
	-- 회원의 이메일
	email varchar2(100) NOT NULL UNIQUE,
	-- 회원 삭제 유무
	is_deleted char(1) DEFAULT 'n' NOT NULL,
	name varchar2(20) NOT NULL,
	img_name varchar2(50) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE board_file
	ADD FOREIGN KEY (bf_num)
	REFERENCES board (num)
;


ALTER TABLE board_reply
	ADD FOREIGN KEY (board_num)
	REFERENCES board (num)
	ON DELETE CASCADE
;


ALTER TABLE board
	ADD FOREIGN KEY (class_num)
	REFERENCES class_info (num)
;


ALTER TABLE class_user
	ADD FOREIGN KEY (class_num)
	REFERENCES class_info (num)
	ON DELETE CASCADE
;


ALTER TABLE drive
	ADD FOREIGN KEY (class_num)
	REFERENCES class_info (num)
;


ALTER TABLE passed_lesson
	ADD FOREIGN KEY (class_num)
	REFERENCES class_info (num)
;


ALTER TABLE task
	ADD FOREIGN KEY (class_num)
	REFERENCES class_info (num)
;


ALTER TABLE drive_file
	ADD FOREIGN KEY (drive_num)
	REFERENCES drive (num)
	ON DELETE CASCADE
;


ALTER TABLE task_answer
	ADD FOREIGN KEY (task_num)
	REFERENCES task (num)
;


ALTER TABLE task_submit
	ADD FOREIGN KEY (task_num)
	REFERENCES task (num)
	ON DELETE CASCADE
;


ALTER TABLE class_user
	ADD FOREIGN KEY (user_id)
	REFERENCES users (id)
;



/* Comments */

COMMENT ON COLUMN board.num IS '게시물의 관리 번호';
COMMENT ON COLUMN board.class_num IS '반의 관리 번호';
COMMENT ON COLUMN board.user_id IS '회원은 id';
COMMENT ON COLUMN board.title IS '게시물의 제목';
COMMENT ON COLUMN board.content IS '게시물의 내용';
COMMENT ON COLUMN board.register_time IS '게시물 등록 시간';
COMMENT ON COLUMN board.hit IS '게시물 조회수';
COMMENT ON COLUMN board_file.num IS '시퀀스';
COMMENT ON COLUMN board_file.original_filename IS '오리지날 파일네임';
COMMENT ON COLUMN board_file.saved_filename IS '저장된 이름';
COMMENT ON COLUMN board_file.bf_num IS '게시물의 관리 번호';
COMMENT ON COLUMN board_reply.num IS '댓글의 관리 번호';
COMMENT ON COLUMN board_reply.board_num IS '게시물의 관리 번호';
COMMENT ON COLUMN board_reply.user_id IS '댓글 작성 회원의 id';
COMMENT ON COLUMN board_reply.content IS '댓글의 내용';
COMMENT ON COLUMN board_reply.parent IS '대댓글의 부모 댓글의 관리 번호';
COMMENT ON COLUMN board_reply.register_time IS '댓글 등록 시간';
COMMENT ON COLUMN board_reply.depth IS '대댓글의 순서';
COMMENT ON COLUMN board_reply.reorder IS '전체 댓글의 순서';
COMMENT ON COLUMN class_info.num IS '반의 관리 번호';
COMMENT ON COLUMN class_info.name IS '반의 이름';
COMMENT ON COLUMN class_info.teacher_id IS '선생님의 id';
COMMENT ON COLUMN class_info.is_public IS '공개 허용 유무 (검색 가능 유무)';
COMMENT ON COLUMN class_user.num IS '반의 학생 관리 번호';
COMMENT ON COLUMN class_user.class_num IS '반의 관리 번호';
COMMENT ON COLUMN class_user.user_id IS '학생의 id';
COMMENT ON COLUMN class_user.status IS '반 학생의 상태(request, student, withdraw)';
COMMENT ON COLUMN drive.class_num IS '반의 관리 번호';
COMMENT ON COLUMN drive.num IS '자료실의 관리 번호';
COMMENT ON COLUMN drive.user_id IS '자료물 등록 회원의 id';
COMMENT ON COLUMN drive.title IS '자료물의 제목';
COMMENT ON COLUMN drive.content IS '자료물의 내용';
COMMENT ON COLUMN drive.register_time IS '자료물 등록 시간';
COMMENT ON COLUMN drive.hit IS '자료물 조회수';
COMMENT ON COLUMN drive_file.num IS 'drive_file 시퀀스 번호';
COMMENT ON COLUMN drive_file.original_filename IS 'original 파일 이름';
COMMENT ON COLUMN drive_file.saved_filename IS '이름 변경된 파일 이름';
COMMENT ON COLUMN drive_file.drive_num IS '자료실의 관리 번호';
COMMENT ON COLUMN drive_file.down_count IS '다운로드 수';
COMMENT ON COLUMN passed_lesson.num IS '지난 강의의 관리 번호';
COMMENT ON COLUMN passed_lesson.class_num IS '반의 관리 번호';
COMMENT ON COLUMN passed_lesson.title IS '강의 이름';
COMMENT ON COLUMN passed_lesson.savetime IS '업로드 시간';
COMMENT ON COLUMN passed_lesson.saved_code IS '업로드 코드의 파일이름';
COMMENT ON COLUMN passed_lesson.saved_audio IS '업로드 음성의 파일이름';
COMMENT ON COLUMN task.num IS '과제의 관리 번호';
COMMENT ON COLUMN task.class_num IS '반의 관리 번호';
COMMENT ON COLUMN task.title IS '과제의 제목';
COMMENT ON COLUMN task.content IS '과제의 내용';
COMMENT ON COLUMN task.question_file IS '과제 파일의 파일 이름';
COMMENT ON COLUMN task.deadline IS '과제의 마감 기간';
COMMENT ON COLUMN task.is_closed IS '과제의 마감 유무';
COMMENT ON COLUMN task_answer.num IS '과제의 답의 관리 번호';
COMMENT ON COLUMN task_answer.task_num IS '과제의 관리 번호';
COMMENT ON COLUMN task_answer.input_answer IS '입력 값';
COMMENT ON COLUMN task_answer.output_answer IS '출력값';
COMMENT ON COLUMN task_submit.num IS '과제 제출의 관리 번호';
COMMENT ON COLUMN task_submit.task_num IS '과제의 관리 번호';
COMMENT ON COLUMN task_submit.user_id IS '회원은 id';
COMMENT ON COLUMN task_submit.submit_file IS '과제 제출 파일의 파일이름';
COMMENT ON COLUMN task_submit.submit_time IS '과제 제출 시간';
COMMENT ON COLUMN users.id IS '회원의 id';
COMMENT ON COLUMN users.password IS '회원의 비밀번호';
COMMENT ON COLUMN users.email IS '회원의 이메일';
COMMENT ON COLUMN users.is_deleted IS '회원 삭제 유무';



