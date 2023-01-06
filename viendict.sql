
use viendict
go
/*create table grammar_tense*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grammar_tense](
	[TenseID] [int] NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NULL,
	[EnName] [nvarchar](50) NULL,
	[Define] [nvarchar](max) NULL,
	[Formula] [nvarchar](max) NULL,
	[How_to_use] [nvarchar](max) NULL,
	[Recognizing_signs] [nvarchar](max) NULL,
)	
GO
/*create table lst_vocab_topic*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_vocab_topic](
	[TopicID] [int] NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NULL,
)	
GO
/*create table lst_vocab*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_vocab](
	[ID] [int] NOT NULL,
	[Word] [nvarchar](50) NULL,
	[TopicID] [int] NOT NULL
)	

/*create table lst_grammar_title*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_grammar_title](
	[ID] [int] NOT NULL Primary key,
	[Title] [nvarchar](100) NULL,
	[Describe] [nvarchar](max) NULL,
)

/*create table lst_wish_types*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_wish_types](
	[ID] [int] NOT NULL Primary key,
	[Name] [nvarchar](100) NULL,
	[Describe] [nvarchar](max) NULL,
)
/*create table lst_wish_sentence_content*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_wish_sentence_content](
	[ID] [int] NOT NULL Primary key,
	[Define] [nvarchar](max) NULL,
	[Formula] [nvarchar](max) NULL,
	[Example] [nvarchar](max) NULL,
)

/*create table lst_study_topic*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_study_topic](
	[TopicID] [int] NOT NULL Primary key,
	[Name] [nvarchar](100) NULL,
	[TotalLessons] [int] NULL,
)

/*create table lst_study_topic_lesson*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_study_topic_lesson](
	[LessonID] [int] NOT NULL ,
	[Name] [nvarchar](100) NULL,
	[TopicID] [int] NOT NULL,
	Primary key (LessonID, TopicID),
)
/*create table lst_study_topic_vocab*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_study_topic_vocab](
	[ID] [int] NOT NULL Primary key,
	[Word] [nvarchar](100) NULL,
	[IPA] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Meaning] [nvarchar](max) NULL,
	[EnExample] [nvarchar](max) NULL,
	[ViExample] [nvarchar](max) NULL,
	[LessonID] [int] NULL,
)

/*create table conditional_sentence_type*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conditional_sentence_type](
	[ID] [int] NOT NULL Primary key,
	[Define] [nvarchar](max) NULL,
	[Formula] [nvarchar](max) NULL,
	[HowToUse] [nvarchar](max) NULL,
)


alter table lst_vocab add constraint pk_lstvocan primary key (ID, TopicID)

--alter table lst_study_topic_vocab add constraint fk_LessonID foreign key (LessonID) references lst_study_topic_lesson (LessonID)

SET ANSI_WARNINGS OFF;
insert into conditional_sentence_type values( 1, N' + Câu điều kiện loại 1 còn có thể được gọi là câu điều kiện hiện tại có thể có thật. Ta sử dụng câu điều kiện loại 1 để đặt ra một điều kiện có thể thực hiện được trong hiện tại và nêu kết quả có thể xảy ra ở hiện tại hoặc tương lai.', N'If + S + V, S + will + V
Chú thích: S - chủ ngữ, V - động từ.

 + Ở câu điều kiện loại 1, mệnh đề "IF" dùng thì hiện tại đơn, mệnh đề chính dùng thì tương lai đơn.', N' + Chỉ một sự thật hiển nhiên, một quy luật tự nhiên hoặc một hành động xảy ra thường xuyên
  Ví dụ:
- If you heat ice, it turns to water.
(Nếu bạn đun nóng nước đá nó sẽ tan thành nước)
- If you press this switch, the computer comes on.
(Nếu bạn nhấn vào nút này, máy tính sẽ bật)

 + Đặt ra một điều kiện có thể thực hiện được trong hiện tại hoặc tương lai
 Ví dụ:
- If you come into my garden, my dog will bite you.
(Nếu anh bước vào vườn của tôi, con chó của tôi sẽ cắn anh)
- If it is sunny, I will go fishing.
(Nếu trời nắng tốt, tôi sẽ đi câu cá)

 + Ngoài ra, các động từ tình thái như: can, may, might, should, ought to, must có thể được dùng trong mệnh đề chính để nói đến khả năng, sự chắc chắn, sự cho phép, sự bắt buộc hoặc cần thiết
 Ví dụ:
- If you need a ticket, I can get you one
(Nếu bạn cần vé, tôi có thể mua cho bạn một cái)')
insert into conditional_sentence_type values( 2, N' + Câu điều kiện loại 2 là câu điều kiện không có thực ở hiện tại. Ta sử dụng câu điều kiện loại 2 để diễn tả điều không thể xảy ra ở hiện tại hoặc tương lai, chỉ là một giả thiết, một ước muốn trái ngược với thực trạng hiện tại.', N'If + S + Ved, S + would + V
Chú thích: S - chủ ngữ, V - động từ.

 + Ở câu điều kiện loại 2, mệnh đề "IF" dùng thì quá khứ đơn, mệnh đề chính dùng thì hiện tại đơn.
 
 + Trong câu điều kiện loại 2, ở mệnh đề "IF" riêng động từ "to be" luôn dùng "were" cho tất cả các ngôi.', N' + Diễn tả điều không thể xảy ra ở hiện tại hoặc tương lai, chỉ là một giả thiết, một ước muốn trái ngược với thực trạng hiện tại.
  Ví dụ:
- If I were a bird, I would be very happy.
(Nếu tôi là một con chim, tôi sẽ rất hạnh phúc) => tôi không thể là con chim được
- If I had a million USD, I would buy that car.
(Nếu tôi có một triệu đô la, tôi sẽ mua chiếc xe đó.) => hiện tại tôi không có

 + Với "could" và "might" có thể được dùng trong mệnh đề chính để nói đến khả năng có thể xảy ra
 Ví dụ:
- If she had a camera, she could take some photos.
(Giá như có máy ảnh, cô ấy có thể chụp vài tấm hình)
- If he worked harder, he might do even better at her studies.
(Giá như anh ta học chăm hơn thì kết quả học tập có thể còn tốt hơn nữa)

 + Dùng để khuyên bảo (If I were you. . .)
 Ví dụ:
- If I were you, I would never buy that car.
(Nếu tôi là bạn, tôi sẽ không bao giờ mua chiếc xe đó)')
insert into conditional_sentence_type values( 3, N' + Câu điều kiện loại 3 là câu điều kiện không có thực trong quá khứ. Ta sử dụng câu điều kiện loại 3 để diễn tả một điều không thể xảy ra trong quá khứ, chỉ mang tính ước muốn trong quá khứ, một giả thiết trái ngược với thực trạng ở quá khứ.', N'If + S + had + V3/-ed, S + have + V3/-ed.
Chú thích: S - chủ ngữ, V3/-ed(Vpp/-ed) - động từ cột 3 trong bảng bất quy tắc hoặc động từ đuôi "ed".

 + Ở câu điều kiện loại 3, mệnh đề "IF" chia ở quá khứ phân từ, mệnh đề chính chia ở điều kiện hoàn thành (perfect conditional)', N' + Diễn tả một điều không thể xảy ra trong quá khứ, chỉ mang tính ước muốn trong quá khứ, một sự hối tiếc, một giả thiết trái ngược với thực trạng ở quá khứ.
 Ví dụ:
- If I hadn’t been absent yesterday, I would have met him.
(Nếu hôm qua tôi không vắng mặt thì tôi đã gặp mặt anh ta rồi)
- If I had known of your arrival, I would have met you.
(Giá mà tôi biết anh đến thì tôi đã đi đón rồi)')
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
insert into lst_study_topic values(1, N'900 từ vựng luyện IELTS', 50)
insert into lst_study_topic values(2, N'600 từ vựng TOEIC', 50)
insert into lst_study_topic values(3, N'1000 từ vựng TOEFL', 50)
insert into lst_study_topic values(4, N'900 từ vựng luyện thi SAT', 59)
SET ANSI_WARNINGS ON;
/*haven't executed*/
--SET ANSI_WARNINGS OFF;
--insert into lst_study_topic_lesson values(1, N'Health problems', 1) 
--insert into lst_study_topic_lesson values(2, N'Academic subjects', 1) 

--insert into lst_study_topic_lesson values(1, N'Contracts', 2) 
--insert into lst_study_topic_lesson values(2, N'Marketing', 2) 

--insert into lst_study_topic_lesson values(1, N'Food crops', 3)

--insert into lst_study_topic_lesson values(1, N'', 4) 
--insert into lst_study_topic_lesson values(2, N'', 4) 

--select * from lst_study_topic_lesson
--SET ANSI_WARNINGS ON;
/*haven't executed*/
SET ANSI_WARNINGS OFF;
insert into lst_study_topic_vocab values(1, 'vaccinate', N'/ˈvæksɪneɪt/', 'verb', N'chủng ngừa, tiêm chủng', N'All children under 6 years old are vaccinated for free.', N'Tất cả trẻ am dưới 6 tuổi được tiêm phòng miễn phí.', 1)
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
insert into lst_grammar_title values(1, N'Các thì trong tiếng Anh', N'Hiện tại đơn, hiện tại tiếp diễn, quá khứ đơn, ...');
insert into lst_grammar_title values(2, N'Câu bị động', N'Câu bị động, các trường hợp đặc biệt');
insert into lst_grammar_title values(3, N'Câu ước', N'Câu ước với Wish loại 1, loại 2 và loại 3');
insert into lst_grammar_title values(4, N'Câu gián tiếp', N'Câu trực tiếp, câu gián tiếp và cách chuyển từ câu trực tiếp sang câu gián tiếp');
insert into lst_grammar_title values(5, N'Câu điều kiện', N'Câu điều kiện loại 1, loại 2, loại 3, ...');
insert into lst_grammar_title values(6, N'Câu so sánh', N'So sánh bằng, so sánh hơn, so sánh nhất, so sánh kép, ...');
insert into lst_grammar_title values(7, N'Mệnh đề quan hệ', N'Đại từ quan hệ, trạng từ quan hệ, rút gọn mệnh đề và lược bỏ đại từ quan hệ');
insert into lst_grammar_title values(8, N'Câu cảm thán', N'Cảm thán với What, How, So, Such, ...');
insert into lst_grammar_title values(9, N'Câu hỏi đuôi', N'Công thức và các dạng đặc biệt của câu hỏi đuôi');
insert into lst_grammar_title values(10, N'Câu đảo ngữ', N'Đảo ngữ với No, Not, Never, Little, Only, ...');
insert into lst_grammar_title values(11, N'Câu mệnh lệnh', N'Câu mệnh lệnh trực tiếp, gián tiếp, dạng phủ định của câu mệnh lệnh, ...');
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
insert into lst_wish_types values(1, N'Câu ước loại 1', N'Định nghĩa, công thức, ví dụ về câu ước loại 1');
insert into lst_wish_types values(2, N'Câu ước loại 2', N'Định nghĩa, công thức, ví dụ về câu ước loại 2');
insert into lst_wish_types values(3, N'Câu ước loại 3', N'Định nghĩa, công thức, ví dụ về câu ước loại 3');
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
insert into lst_wish_sentence_content values(1, N'Câu ước loại 1 dùng để diễn tả những mong ước về một sự việc trong tương lai. Chúng ta sử dụng câu ước ở tương lai với mong muốn ai đó, sự việc gì đó sẽ tốt đẹp hơn trong tương lai.', N'	• Khẳng định: S + wish(es) + S + would + V(nguyên thể).

	• Phủ định: S + wish(es) + S + wouldn’t + V(nguyên thể).
	
	• IF ONLY + S + would/could + V(nguyên thể)

Chú thích: S - chủ ngữ, V - động từ.

	• Chú ý:
  * Đối với chủ ngữ ở vế “wish” là chủ ngữ số nhiều, chúng ta sử dụng wish. (They wish, Many people wish,…)
  Ví dụ:
  - We wish we would travel to America one day.
(Chúng tôi ước rằng chúng tôi sẽ du lịch tới Mỹ vào một ngày nào đó)
  * Đối với chủ ngữ ở vế “wish” là chủ ngữ số ít, chúng ta sử dụng wishes. (He wishes, the boy wishes,...)
  Ví dụ:
  - She wishes she would earn a lot of money next year
(Cô ấy ước cô ấy sẽ kiếm được rất nhiều tiền trong năm tới)
  * Động từ ở mệnh đề sau ta chia ở dạng nguyên thể vì đứng trước nó là Modal verbs: would/could.', N'Một số ví dụ về câu ước loại 1:
  - I wish I would be an astronaut in the future.
(Tôi ước mình sẽ là một phi hành gia trong tương lai.)

  - Tom wishes he could visit Paris next summer.
(Tom muốn anh có thể tới thăm Paris vào mùa hè năm sau)

  - If only I would take the trip with you next Sunday.
  - I wish they would stop arguing.
  - If only I would be able to attend your wedding next week.')

insert into lst_wish_sentence_content values(2, N'Câu ước loại 2 dùng để diễn tả những mong ước về một sự việc không có thật ở hiện tại, hay giả định một điều ngược lại so với thực tế.Chúng ta dùng câu ước ở hiện tại để ước về điều không có thật ở hiện tại, thường là thể hiện sự nuối tiếc về tình huống hiện tại (regret about present situations).', N'	• Khẳng định: S + wish(es) + S + V2/-ed + O. (to be: were/weren’t)

	• Phủ định: S + wish(es) + S + didn’t + V(nguyên thể).
	
	• IF ONLY + S + V(quá khứ)

Chú thích: S - chủ ngữ, V2/-ed - động từ cột 2 trong bảng bất quy tắc hoặc động từ đuôi "ed".

	• Chú ý:
  - Động từ “wish” chia theo thì và chia theo chủ ngữ
  - Động từ chính trong mệnh đề sau “wish” chia thì quá khứ đơn
  - Động từ “to be” chia là “were” với tất cả các chủ ngữ trong câu ước.', N'Một số ví dụ về câu ước loại 2:
  - He wishes he didn’t work in this company at present
(Anh ấy ước rằng hiện tại anh ấy không làm việc cho công ty này.)

  - She wishes she were a billionaire at the moment.
(Cô ấy ước rằng lúc này cô ấy là một tỷ phú -> Thực tế hiện tại cô ấy không phải là một tỷ phú.)

  - If wish I were rich. (But I am poor now).
  - I can’t swim. I wish I could swim.
  - We wish that we didn’t have to go to class today.')

insert into lst_wish_sentence_content values(3, N'Câu ước loại 3 dùng để diễn tả những mong ước về một sự việc không có thật ở quá khứ, hay giả định một điều ngược lại so với thực tại đã xảy ra ở quá khứ. Chúng ta sử dụng câu ước ở quá khứ để ước điều trái với những gì xảy ra trong quá khứ, thường là để diễn tả sự nuối tiếc với tình huống ở quá khứ.', N'	• Khẳng định: S + wish(es) + S + had + V3/-ed.

	• Phủ định: S + wish(es) + S + hadn’t + V3/-ed.
	
	• IF ONLY + S + V3/-ed

	Ta có: S + WISH + S + COULD HAVE + V3/-ed = IF ONLY+ S + COULD HAVE + V3/-ed

Chú thích: S - chủ ngữ, V3/-ed - động từ cột 3 trong bảng bất quy tắc hoặc động từ đuôi "ed"

	• Chú ý:
  - Động từ "wish" chia theo thì và chia theo chủ ngữ
  - Động từ sau "wish" chia thì quá khứ hoàn thành.', N'Một số ví dụ về câu ước loại 3:
  - Mary wishes she had gone to school yesterday
(Mary ước rằng cô ấy đã đi học ngày hôm qua)

  - I wish I hadn`t gone to that party.
(Tôi ước là tôi đã không đến bữa tiệc đó)

  - She wishes she had been listening to the teacher
(Cô ấy ước rằng lúc đó cô ấy nghe cô giáo giảng bài)

  - If only I had gone by taxi. (I didn’t go by taxi).
  - She wishes she had had enough money to buy the house.
  - I wish I hadn’t failed my exam last year.')
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
INSERT INTO grammar_tense VALUES(1, N'Thì hiện tại đơn', 'Simple present tense', N'	Thì hiện tại đơn (Simple present tense) dùng để diễn tả một sự thật hiển nhiên hay một hành động diễn ra lặp đi lặp lại theo thói quen, phong tục, khả năng.', N'		• Đối với động từ thường:
	- Khẳng định: S + V(s/es) + O
	- Phủ định: S + do not /does not + V_inf
	- Nghi vấn: Do/Does + S + V_inf?
	- Ví dụ: 
 + She gets up at 5 am. (Cô ấy thức dậy lúc 5 giờ)
 + She doesn’t eat chocolate. (Cô ấy không ăn sô cô la)
 + Does she eat pastries? (Cô ấy có ăn bánh ngọt không?)
		• Đối với động từ “to be”:
	- Khẳng định: S + be (am/is/are) + O
	- Phủ định: S + be (am/is/are) + not + O
	- Nghi vấn: Am/is/are + S + O?
	- Ví dụ:
 + She is a student. (Cô ấy là học sinh)
 + She is not a teacher. (Cô ấy không phải là giáo viên)
 + Is she a student? (Cô ấy có phải là học sinh không)', N'		• Thì hiện tại đơn diễn tả một sự thật hiển nhiên, một chân lý.
 Ex: The sun rises in the East and sets in the West. (Mặt trời mọc ở hướng Đông và lặn ở hướng Tây)
		• Thì hiện tại đơn diễn tả 1 hành động xảy ra thường xuyên, một thói quen ở hiện tại.
 Ex: He gets up early every morning.(Anh dậy sớm mỗi sáng.)
		• Thì hiện tại đơn diễn tả một năng lực của con người.
 Ex: He plays basketball very well (Anh ấy chơi bóng rổ rất giỏi)
		• Ngoài ra, thì hiện tại đơn còn diễn tả một kế hoạch đã được sắp xếp trong tương lai, đặc biệt là trong việc di chuyển.
 Ex: The train leaves at 9 am tomorrow. (Tàu khởi hành lúc 9 giờ sáng ngày mai)', N'	Trong câu có chứa các trạng từ chỉ tần suất như:
		• Every day/ week/ month…: mỗi ngày/ tuần/ tháng
		• Often, usually, frequently: thường
		• Sometimes, occasionally: thỉnh thoảng
		• Always, constantly: luôn luôn
		• Seldom, rarely: hiếm khi');
INSERT INTO grammar_tense VALUES(2, N'Thì hiện tại tiếp diễn', 'Present continuous tense', N'	Thì hiện tại tiếp diễn (Present continuous tense) dùng để diễn tả những sự việc xảy ra ngay lúc chúng ta nói hay xung quanh thời điểm chúng ta nói, và hành động đó vẫn chưa chấm dứt (còn tiếp tục diễn ra).', N'	• Khẳng định: S + am/is/are + V_ing
 Ex: I am watching TV now. (Tôi đang xem ti vi)
	• Phủ định: S + am/is/are + not + V_ing
 Ex: The baby is crying. (Đứa bé đang khóc)
	• Nghi vấn: Am/Is/Are + S + V_ing?
 Ex: Are you talking to me? (Có phải bạn đang nói chuyện với tôi không?)', N'		• Diễn tả một hành động đang diễn ra và kéo dài tại một thời điểm ở hiện tại.
 Ex: The students are playing football now. (Những học sinh đang chơi bóng đá.)
		• Thường tiếp theo sau mệnh lệnh, câu đề nghị.
 Ex: Be quiet! The baby is sleeping. (Im lặng nào! Em bé đang ngủ.)
		• Diễn tả 1 hành động xảy ra lặp đi lặp lại, dùng phó từ ALWAYS:
 Ex: She is always borrowing our books and then she doesn’t remember. (Cô ấy luôn mượn sách của chúng tôi và sau đó cô ấy không nhớ.)
		• Diễn tả một hành động sắp xảy ra (ở trong tương lai gần)
 Ex: Tomorrow morning, I am taking a bus to the centre to visit my relative. (Buổi sáng ngày mai tôi sẽ đi xe buýt đến trung tâm để thăm người thân của tôi.)', N'	Trong câu có chứa các từ sau:
		• Now: bây giờ
		• Right now
		• Listen!: Nghe nào!
		• At the moment
		• At present
		• Look!: nhìn kìa
		• Watch out!: cẩn thận!
		• Be quiet!: Im lặng!
	• Lưu ý: Không dùng thì này với các động từ chỉ nhận thức, tri giác như: be, understand (hiểu), know (biết), like (thích) ,want (muốn), see (nhìn), hear (nghe), glance (liếc qua), feel (cảm thấy), think (nghĩ), smell (ngửi), love (yêu), hate (ghét), realize (nhận ra), seem (dường như), remember (nhớ),  forget (quên), etc.
	Với các động từ này, sử dụng Thì hiện tại đơn.');
INSERT INTO grammar_tense VALUES(3, N'Thì hiện tại hoàn thành', 'Present perfect tense', N'	Thì hiện tại hoàn thành (Present perfect tense) dùng để diễn tả một hành động, sự việc đã bắt đầu từ trong quá khứ, kéo dài đến hiện tại và có thể tiếp tục tiếp diễn trong tương lai.', N'	• Khẳng định: S + have/has + V3/ed + O
 Ex: I have already finished my homework. (Tôi đã hoàn thành bài tập về nhà)
	• Phủ định: S + have/has + not + V3/ed + O
 Ex: I haven’t finished my homework yet. (Tôi vẫn chưa hoàn thành bài tập về nhà)
	• Nghi vấn: Have/has + S + V3/ed + O?
 Ex: Have you done your homework? (Bạn đã làm xong bài tập về nhà chưa?)', N'		• Diễn tả hành động đã xảy ra hoặc chưa bao giờ xảy ra ở 1 thời gian không xác định trong quá khứ.
		• Diễn tả sự lặp đi lặp lại của 1 hành động trong quá khứ.
		• Được dùng với since và for.
		• Since + thời gian bắt đầu (1995, I was young, this morning etc.). Khi người nói dùng since, người nghe phải tính thời gian là bao lâu.
		• For + khoảng thời gian (từ lúc đầu tới bây giờ). Khi người nói dùng for, người nói phải tính thời gian là bao lâu.
 Ex: I’ve done all my homework (Tôi đã làm tất cả bài tập về nhà)
	 She has lived in Liverpool all her life (Cô ấy đã sống ở Liverpool cả đời)', N'	Trong câu có chứa các từ sau:
			• Just, recently, lately: gần đây, vừa mới
			• Already: đã….rồi , before: đã từng
			• Not ... yet: chưa
			• Never, ever
			• Since, for
			• So far = until now = up to now: cho đến bây giờ
			• So sánh nhất');
INSERT INTO grammar_tense VALUES(4, N'Thì hiện tại hoàn thành tiếp diễn', 'Present perfect continuous tense', N'	Thì hiện tại hoàn thành tiếp diễn (Present perfect continuous tense) là thì diễn tả sự việc bắt đầu trong quá khứ và tiếp tục ở hiện tại có thể tiếp diễn ở tương lai sự việc đã kết thúc nhưng ảnh hưởng kết quả còn lưu lại hiện tại.', N'	• Khẳng định: S + have/has + been + V_ing
 Ex: She has been running all day. (Cô ấy đã chạy liên tục cả ngày)
	• Phủ định: S + have/has + not + been + V_ing
 Ex: She has not been running all day. (Cô ấy không chạy liên tục cả ngày)
	• Nghi vấn: Has/ Have + S + been+ V_ing?
 Ex: Has she been running all day? (Có phải cô ấy đã chạy liên tục cả ngày?)', N'	• Dùng để nhấn mạnh tính liên tục của một sự việc bắt đầu từ quá khứ và tiếp diễn đến hiện tại.
 Ex: She has been learning English for 6 years. (Cô ấy đã học tiếng Anh được 6 năm)
	• Diễn tả hành động vừa kết thúc với mục đích nêu lên tác dụng và kết quả của hành động ấy.
 Ex: I am exhausted because I have been working all day. (Tôi kiệt sức bởi vì tôi đã làm việc cả ngày)', N'	Các từ để nhận biết:
		• All day, all week, all month: cả ngày/tuần/tháng
		• Since, for');
INSERT INTO grammar_tense VALUES(5, N'Thì quá khứ đơn', 'Past simple tense', N'	Thì quá khứ đơn (Past simple tense) dùng để diễn tả một hành động, sự việc diễn ra và kết thúc trong quá khứ.', N'		• Đối với động từ thường:
	- Khẳng định: S + V2/ed + O
	- Phủ định: S + didn’t + V_inf + O
	- Nghi vấn: Did + S + V_inf + O?
	- Ví dụ:
 + I saw Peter yesterday. (Ngày hôm qua tôi đã nhìn thấy Peter)
 + I didn’t go to school yesterday. (Ngày hôm qua tôi đã không đi học)
 + Did you visit Mary last week? (Tuần trước bạn đã đến thăm Mary phải không?)
		• Đối với động từ “to be”:
	- Khẳng định: S + was/were + O
	- Phủ định: S + was/were + not + O
	- Nghi vấn: Was/were + S + O?
	- Ví dụ:
 + I was tired yesterday. (Ngày hôm qua tôi đã rất mệt)
 + The supermarket was not full yesterday. (Ngày hôm qua, siêu thị không đông)
 + Were you absent yesterday? (Hôm qua bạn vắng phải không?', N'		• Diễn tả hành động đã xảy ra và chấm dứt trong quá khứ.
 Ex: I used to go swimming with neighbor friends when I was young. (Lúc nhỏ tôi đã từng đi bơi với các bạn hàng xóm)
		• Diễn tả chuỗi hành động xảy ra liên tiếp
 Ex:  I got up, brushed my teeth and then had breakfast. (Tôi thức dậy, đánh răng rồi ăn sáng)
		• Dùng trong câu điều kiện loại 2
 Ex: If you studied hard, you could pass the entrance examination. (Nếu bạn học hành chăm chỉ, thì bạn đã đậu kỳ thi đại học)', N'	Các từ thường xuất hiện:
		• Ago: cách đây ...
		• In...
		• Yesterday: ngày hôm qua
		• Last night/month ...: tối qua, tháng trước');
INSERT INTO grammar_tense VALUES(6, N'Thì quá khứ tiếp diễn','Past continuous tense', N'	Thì quá khứ tiếp diễn (Past continuous tense) dùng để diễn tả một hành động, sự việc đang diễn ra xung quanh một thời điểm trong quá khứ.', N'	• Khẳng định: S + was/were + V_ing + O
 Ex: She was watching TV at 8 o’clock last night. (Tối hôm qua lúc 8 giờ cô ấy đang xem ti vi)
	• Phủ định: S + was/were + not + V_ing + O
 Ex: She wasn’t watching TV at 8 o’clock last night. (Tối hôm qua lúc 8 giờ cô ấy không xem ti vi)
	• Nghi vấn: Was/were + S + V_ing + O?
 Ex: Was she watching TV at 8 o’clock last night? (Có phải tối hôm qua lúc 8 giờ cô ấy đang xem TV?)', N'		• Diễn tả hành động đang xảy ra tại một thời điểm xác định trong quá khứ.
 Ex: I was having dinner at 7 o’clock last night. (Tôi đang ăn tối lúc 7 giờ tối hôm qua)
		• Diễn tả một hành động đang xảy ra trong quá khứ thì một hành động khác xen vào (hành động xen vào thường được chia ở quá khứ đơn).
 Ex: I was watching TV when she called. (Trong khi đang xem TV thì cô ấy gọi)
		• Diễn tả những hành động xảy ra song song với nhau.
 Ex: While Ellen was reading book, Tom was watching television. (Trong khi Ellen đang đọc sách thì Tom đang xem TV)', N'	Trong câu xuất hiện các từ:
		• At 5pm last Sunday
		• At this time last night
		• When/while/as
		• From 4pm to 9pm ...');
INSERT INTO grammar_tense VALUES(7, N'Thì quá khứ hoàn thành', 'Past perfect tense', N'	Thì quá khứ hoàn thành (Past perfect tense) dùng để diễn tả một hành động xảy ra trước một hành động khác trong quá khứ. Hành động nào xảy ra trước thì dùng thì quá khứ hoàn thành. Hành động xảy ra sau thì dùng thì quá khứ đơn.', N'	• Khẳng định: S + had + V3/ed + O
 Ex: By 4 pm yesterday, he had left his house (Đến 4 giờ chiều ngày hôm qua, anh đã rời khỏi nhà.)
	• Phủ định: S + had + not + V3/ed + O
 Ex: By 4pm yesterday, he had not left his house (Đến 4 giờ chiều ngày hôm qua, anh vẫn chưa rời khỏi nhà.)
	• Nghi vấn: Had + S + V3/ed + O?
 Ex: Had he left his house by 4pm yesterday? (Anh ấy đã rời khỏi nhà của mình trước 4 giờ chiều ngày hôm qua phải không?)', N'		• Diễn tả hành động đã hoàn thành trước một thời điểm ở trong quá khứ.
 Ex: By 4pm yesterday she had left his house. (Cô ấy rời nhà trước 4 giờ hôm qua)
		• Diễn đạt một hành động xảy ra trước một hành động khác ở trong quá khứ. Hành động xảy ra trước dùng thì quá khứ hoàn thành – hành động xảy ra sau dùng thì quá khứ đơn.
 Ex: Before she went to bed, she had done her homework. (Trước khi cô ấy đi ngủ, cô ấy đã làm xong bài tập)
		• Dùng trong câu điều kiện loại 3
 Ex: If you had studied hard, you could have passed the entrance examination. (Nếu bạn học hành chăm chỉ, bạn đã đậu kỳ thi đại học)', N'	Trong câu chứa các từ:
		• By the time, prior to that time
		• As soon as, when
		• Before, after
		• Until then');
INSERT INTO grammar_tense VALUES(8, N'Thì quá khứ hoàn thành tiếp diễn', 'Past perfect continuous tense', N'	Thì quá khứ hoàn thành tiếp diễn (Past perfect continuous tense) dùng để diễn tả một hành động, sự việc đã đang xảy ra trong quá khứ và kết thúc trước một hành động cũng xảy ra trong quá khứ.', N'	• Khẳng định: S + had been + V_ing + O
 Ex: He had been watching films. (Anh ấy đã đang xem phim)
	• Phủ định: S + had + not + been + V_ing + O
 Ex: He hadn’t been watching film.(Anh ấy đã không đang xem phim)
	• Nghi vấn: Had + S + been + V_ing + O?
 Ex: Had he been watching films? (Có phải anh ấy đã đang xem phim?)', N'		• Thì quá khứ hoàn thành tiếp diễn dùng để nhấn mạnh khoảng thời gian của 1 hành động đã xảy ra trong quá khứ và kết thúc trước 1 hành động khác xảy ra và cũng kết thúc trong quá khứ.
 Ex: Sam gained weight because he had been overeating. (Sam tăng cân vì ăn quá nhiều)', N'	Trong câu thường chứa:
		• Before, after
		• Until then
		• Since, for');
INSERT INTO grammar_tense VALUES(9, N'Thì tương lai đơn', 'Simple future tense', N'	Thì tương lai đơn trong tiếng Anh (Simple future tense) được dùng khi không có kế hoạch hay quyết định làm gì nào trước khi chúng ta nói. Chúng ta ra quyết định tự phát tại thời điểm nói.', N'	• Khẳng định: S + will/shall/ + V_inf + O
	• Phủ định: S + will/shall + not + V_inf + O
	• Nghi vấn: Will/shall + S + V_inf + O?', N'		• Diễn tả một dự đoán nhưng không có căn cứ.
 Ex: I think It will rain. (Tôi nghĩ trời sẽ mưa)
		• Diễn tả một quyết định đột xuất ngay lúc nói.
 Ex: I will bring coffee to you. (Tôi sẽ mang cà phê cho bạn)
		• Diễn tả lời ngỏ ý, một lời hứa, đe dọa, đề nghị.
 Ex: I will never speak to you again. (Tôi sẽ không bao giờ nói chuyện với bạn lần nữa)
		• Dùng trong mệnh đề chính của câu điều kiện loại 1.
 Ex: If you don’t hurry, you will be late. (Nếu bạn không nhanh lên, bạn sẽ bị muộn)', N'	Trong câu thường có:
		• Tomorrow: ngày mai
		• in + thời gian
		• Next week/month/year: tuần/tháng/năm tới
		• 10 years from now');
INSERT INTO grammar_tense VALUES(10, N'Thì tương lai tiếp diễn', 'Future continuous tense', N'	Thì tương lai tiếp diễn (Future continuous tense) dùng để diễn tả một hành động, sự việc sẽ đang diễn ra tại một thời điểm cụ thể trong tương lai.', N'	• Khẳng định: S + will/shall + be + V-ing
		• Phủ định: S + will/shall + not + be + V-ing
		• Nghi vấn: Will/shall + S + be + V-ing?', N'		• Diễn tả hành động hay sự việc đang diễn ra ở một thời điểm xác định trong tương lai hoặc hành động sẽ diễn ra và kéo dài liên tục suốt một khoảng thời gian ở tương lai.
		• Đôi khi nó cũng diễn tả hành động sẽ xảy ta như một phần trong kế hoạch hoặc một phần trong thời gian biểu.
 Ex: She will be climbing on the mountain at this time next Saturday. (Cô ấy sẽ leo núi vào giờ này thứ 7 tới.)', N'	Trong câu thường chứa các cụm từ:
		• Next year, next week
		• Next time, in the future
		• And soon');
INSERT INTO grammar_tense VALUES(11, N'Thì tương lai hoàn thành', 'Future perfect tense', N'	Thì tương lai hoàn thành (Future perfect tense) dùng để diễn tả một hành động hay sự việc hoàn thành trước một thời điểm trong tương lai.', N'	• Khẳng định: S + shall/will + have + V3/ed
 Ex: I will have finished my homework by 9 o’clock. (Tôi sẽ hoàn thành bài tập về nhà trước 9 giờ)
	• Phủ định: S + shall/will + NOT + have + V3/ed + O
 Ex: They will have not built their house by the end of this month. (Trước cuối tháng này, họ vẫn sẽ chưa xây xong ngôi nhà)\
	• Nghi vấn: Shall/Will+ S + have + V3/ed?
 Ex: Will you have finished your homework by 9 o’clock? (Bạn sẽ làm xong bài trước 9 giờ chứ?)\n 
 → Yes, I will / No, I won’t.', N'		• Diễn tả 1 hành động trong tương lai sẽ kết thúc trước 1 hành động khác trong tương lai.
 Ex: She will have finished her homework before 11 o’clock this evening. (Cô ấy sẽ hoàn thành bài tập về nhà trước 11 giờ tối nay.)', N'	Trong câu thường chứa các từ:
		• By, before + thời gian tương lai
		• By the time ...
		• By the end of + thời gian trong tương lai');
INSERT INTO grammar_tense VALUES(12, N'Thì tương lai hoàn thành tiếp diễn', 'Future perfect continuous tense', N'	Thì tương lai hoàn thành tiếp diễn (Future perfect continuous tense) dùng để diễn tả một hành động, sự việc sẽ xảy ra và xảy ra liên tục trước một thời điểm nào đó trong tương lai.', N'	• Khẳng định: S + will/shall + have been + V_ing
 Ex: We will have been living in this house for 10 years by next month. (Chúng tôi sẽ đã sống trong ngôi nhà này được 10 năm vào tháng tới.)
	• Phủ định: S + will not + have been + V_ing
 Ex: We will not have been living in this house for 10 years by next month. (Chúng tôi sẽ không sống trong ngôi nhà này trong 10 năm vào tháng tới.)
	• Nghi vấn: Will/shall + S + have been + V-ing?
 Ex: Will they have been building this house by the end of this year? (Họ sẽ xây dựng ngôi nhà này vào cuối năm nay chứ?)', N'		• Diễn nhấn mạnh khoảng thời gian của 1 hành động sẽ đang xảy ra trong tương lai và sẽ kết thúc trước 1 hành động khác trong tương lai.
 Ex: I will have been studying English for 10 year by the end of next month. (Tôi sẽ học tiếng Anh được 10 năm vào cuối tháng tới.)', N'	Trong câu xuất hiện các từ:
		• For + khoảng thời gian + by/before + mốc thời gian trong tương lai
		• For 2 years by the end of this
		• By the time
		• By then');

SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
insert into lst_vocab_topic values(1, 'Business English Vocabulary')
insert into lst_vocab_topic values(2, 'Easy Vocabulary')
insert into lst_vocab_topic values(3, 'GMAT Core English')
insert into lst_vocab_topic values(4, 'GRE Core English')
insert into lst_vocab_topic values(5, 'Hard Vocabulary')
insert into lst_vocab_topic values(6, 'IELTS Core English')
insert into lst_vocab_topic values(7, 'Middle Vocabulary')
insert into lst_vocab_topic values(8, 'SAT Core English')
insert into lst_vocab_topic values(9, 'TOEFL Core English')
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
insert into lst_vocab values (1, 'pharmacy', 1)
insert into lst_vocab values (2, 'foregone', 1)
insert into lst_vocab values (3, 'president', 1)
insert into lst_vocab values (4, 'plastic', 1)
insert into lst_vocab values (5, 'provisionally', 1)
insert into lst_vocab values (6, 'incentive', 1)
insert into lst_vocab values (7, 'calculate', 1)
insert into lst_vocab values (8, 'designation', 1)
insert into lst_vocab values (9, 'compete', 1)
insert into lst_vocab values (10, 'furnish', 1)
insert into lst_vocab values (11, 'bribery', 1)
insert into lst_vocab values (12, 'detrimental', 1)
insert into lst_vocab values (13, 'knock', 1)
insert into lst_vocab values (14, 'roll', 1)
insert into lst_vocab values (15, 'autonomy', 1)
insert into lst_vocab values (16, 'deputy', 1)
insert into lst_vocab values (17, 'movement', 1)
insert into lst_vocab values (18, 'oversubscribe', 1)
insert into lst_vocab values (19, 'advanced', 1)
insert into lst_vocab values (20, 'factoring', 1)
insert into lst_vocab values (21, 'joke', 1)
insert into lst_vocab values (22, 'role', 1)
insert into lst_vocab values (23, 'cage', 1)
insert into lst_vocab values (24, 'upbeat', 1)
insert into lst_vocab values (25, 'jet', 1)
insert into lst_vocab values (26, 'inquire', 1)
insert into lst_vocab values (27, 'alternate', 1)
insert into lst_vocab values (28, 'cost-effectiveness', 1)
insert into lst_vocab values (29, 'essential', 1)
insert into lst_vocab values (30, 'asset', 1)
insert into lst_vocab values (31, 'differentiate', 1)
insert into lst_vocab values (32, 'rigid', 1)
insert into lst_vocab values (33, 'sequel', 1)
insert into lst_vocab values (34, 'meet', 1)
insert into lst_vocab values (35, 'partial', 1)
insert into lst_vocab values (36, 'evolution', 1)
insert into lst_vocab values (37, 'creditworthiness', 1)
insert into lst_vocab values (38, 'fee', 1)
insert into lst_vocab values (39, 'paradox', 1)
insert into lst_vocab values (40, 'native', 1)
insert into lst_vocab values (41, 'dilution', 1)
insert into lst_vocab values (42, 'monopolize', 1)
insert into lst_vocab values (43, 'subcommittee', 1)
insert into lst_vocab values (44, 'bondholder', 1)
insert into lst_vocab values (45, 'quality', 1)
insert into lst_vocab values (46, 'cheque', 1)
insert into lst_vocab values (47, 'forbid', 1)
insert into lst_vocab values (48, 'array', 1)
insert into lst_vocab values (49, 'symptom', 1)
insert into lst_vocab values (50, 'steady', 1)
insert into lst_vocab values (51, 'dynamic', 1)
insert into lst_vocab values (52, 'typist', 1)
insert into lst_vocab values (53, 'judgment', 1)
insert into lst_vocab values (54, 'vastly', 1)
insert into lst_vocab values (55, 'behavior', 1)
insert into lst_vocab values (56, 'dissipate', 1)
insert into lst_vocab values (57, 'justify', 1)
insert into lst_vocab values (58, 'secondary', 1)
insert into lst_vocab values (59, 'undercut', 1)
insert into lst_vocab values (60, 'net', 1)
insert into lst_vocab values (61, 'mathematics', 1)
insert into lst_vocab values (62, 'relief', 1)
insert into lst_vocab values (63, 'transform', 1)
insert into lst_vocab values (64, 'token', 1)
insert into lst_vocab values (65, 'guard', 1)
insert into lst_vocab values (66, 'decipher', 1)
insert into lst_vocab values (67, 'conversation', 1)
insert into lst_vocab values (68, 'b/e', 1)
insert into lst_vocab values (69, 'lucrative', 1)
insert into lst_vocab values (70, 'trial', 1)
insert into lst_vocab values (71, 'illegal', 1)
insert into lst_vocab values (72, 'disequilibrium', 1)
insert into lst_vocab values (73, 'consultant', 1)
insert into lst_vocab values (74, 'hazard', 1)
insert into lst_vocab values (75, 'suffer', 1)
insert into lst_vocab values (76, 'amalgamate', 1)
insert into lst_vocab values (77, 'abbreviation', 1)
insert into lst_vocab values (78, 'ATM', 1)
insert into lst_vocab values (79, 'beginner', 1)
insert into lst_vocab values (80, 'broke', 1)
insert into lst_vocab values (81, 'labor', 1)
insert into lst_vocab values (82, 'analyze', 1)
insert into lst_vocab values (83, 'expertise', 1)
insert into lst_vocab values (84, 'including', 1)
insert into lst_vocab values (85, 'red', 1)
insert into lst_vocab values (86, 'averaging', 1)
insert into lst_vocab values (87, 'guess', 1)
insert into lst_vocab values (88, 'predict', 1)
insert into lst_vocab values (89, 'library', 1)
insert into lst_vocab values (90, 'guest', 1)
insert into lst_vocab values (91, 'advice', 1)
insert into lst_vocab values (92, 'abstain', 1)
insert into lst_vocab values (93, 'reluctant', 1)
insert into lst_vocab values (94, 'paradigm', 1)
insert into lst_vocab values (95, 'treasurer', 1)
insert into lst_vocab values (96, 'change', 1)
insert into lst_vocab values (97, 'drop', 1)
insert into lst_vocab values (98, 'consumption', 1)
insert into lst_vocab values (99, 'exception', 1)
insert into lst_vocab values (100, 'tool', 1)

insert into lst_vocab values (1, 'brave', 2)
insert into lst_vocab values (2, 'plastic', 2)
insert into lst_vocab values (3, 'stocking', 2)
insert into lst_vocab values (4, 'calculate', 2)
insert into lst_vocab values (5, 'profession', 2)
insert into lst_vocab values (6, 'attraction', 2)
insert into lst_vocab values (7, 'compete', 2)
insert into lst_vocab values (8, 'religion', 2)
insert into lst_vocab values (9, 'furnish', 2)
insert into lst_vocab values (10, 'cripple', 2)
insert into lst_vocab values (11, 'tremble', 2)
insert into lst_vocab values (12, 'event', 2)
insert into lst_vocab values (13, 'lope', 2)
insert into lst_vocab values (14, 'ribbon', 2)
insert into lst_vocab values (15, 'leak', 2)
insert into lst_vocab values (16, 'jet', 2)
insert into lst_vocab values (17, 'delicate', 2)
insert into lst_vocab values (18, 'timber', 2)
insert into lst_vocab values (19, 'distinction', 2)
insert into lst_vocab values (20, 'column', 2)
insert into lst_vocab values (21, 'active', 2)
insert into lst_vocab values (22, 'tough', 2)
insert into lst_vocab values (23, 'heel', 2)
insert into lst_vocab values (24, 'barber', 2)
insert into lst_vocab values (25, 'sleeve', 2)
insert into lst_vocab values (26, 'partial', 2)
insert into lst_vocab values (27, 'evolution', 2)
insert into lst_vocab values (28, 'brass', 2)
insert into lst_vocab values (29, 'scrape', 2)
insert into lst_vocab values (30, 'stadium', 2)
insert into lst_vocab values (31, 'curriculum', 2)
insert into lst_vocab values (32, 'leap', 2)
insert into lst_vocab values (33, 'span', 2)
insert into lst_vocab values (34, 'raw', 2)
insert into lst_vocab values (35, 'moral', 2)
insert into lst_vocab values (36, 'justice', 2)
insert into lst_vocab values (37, 'grab', 2)
insert into lst_vocab values (38, 'vivid', 2)
insert into lst_vocab values (39, 'accordingly', 2)
insert into lst_vocab values (40, 'indoor', 2)
insert into lst_vocab values (41, 'imaginary', 2)
insert into lst_vocab values (42, 'ignorance', 2)
insert into lst_vocab values (43, 'connect', 2)
insert into lst_vocab values (44, 'commerce', 2)
insert into lst_vocab values (45, 'relief', 2)
insert into lst_vocab values (46, 'fantasy', 2)
insert into lst_vocab values (47, 'drip', 2)
insert into lst_vocab values (48, 'consultancy', 2)
insert into lst_vocab values (49, 'inquiry', 2)
insert into lst_vocab values (50, 'preventive', 2)
insert into lst_vocab values (51, 'suburb', 2)
insert into lst_vocab values (52, 'mention', 2)
insert into lst_vocab values (53, 'foundation', 2)
insert into lst_vocab values (54, 'resistant', 2)
insert into lst_vocab values (55, 'sophisticated', 2)
insert into lst_vocab values (56, 'ignore', 2)
insert into lst_vocab values (57, 'ridiculous', 2)
insert into lst_vocab values (58, 'tone', 2)
insert into lst_vocab values (59, 'purple', 2)
insert into lst_vocab values (60, 'illegal', 2)
insert into lst_vocab values (61, 'invisible', 2)
insert into lst_vocab values (62, 'jazz', 2)
insert into lst_vocab values (63, 'provocation', 2)
insert into lst_vocab values (64, 'solar', 2)
insert into lst_vocab values (65, 'bullet', 2)
insert into lst_vocab values (66, 'zone', 2)
insert into lst_vocab values (67, 'suspend', 2)
insert into lst_vocab values (68, 'fancy', 2)
insert into lst_vocab values (69, 'basis', 2)
insert into lst_vocab values (70, 'infant', 2)
insert into lst_vocab values (71, 'architecture', 2)
insert into lst_vocab values (72, 'consumer', 2)
insert into lst_vocab values (73, 'echo', 2)
insert into lst_vocab values (74, 'surgery', 2)
insert into lst_vocab values (75, 'qualification', 2)
insert into lst_vocab values (76, 'personnel', 2)
insert into lst_vocab values (77, 'pessimistic', 2)
insert into lst_vocab values (78, 'rope', 2)
insert into lst_vocab values (79, 'jar', 2)
insert into lst_vocab values (80, 'priority', 2)
insert into lst_vocab values (81, 'civilian', 2)
insert into lst_vocab values (82, 'reputation', 2)
insert into lst_vocab values (83, 'motion', 2)
insert into lst_vocab values (84, 'lorry', 2)
insert into lst_vocab values (85, 'alongside', 2)
insert into lst_vocab values (86, 'execute', 2)
insert into lst_vocab values (87, 'automatic', 2)
insert into lst_vocab values (88, 'leisure', 2)
insert into lst_vocab values (89, 'label', 2)
insert into lst_vocab values (90, 'display', 2)
insert into lst_vocab values (91, 'resist', 2)
insert into lst_vocab values (92, 'criticism', 2)
insert into lst_vocab values (93, 'jaw', 2)
insert into lst_vocab values (94, 'rural', 2)
insert into lst_vocab values (95, 'mislead', 2)
insert into lst_vocab values (96, 'fascinate', 2)
insert into lst_vocab values (97, 'lean', 2)
insert into lst_vocab values (98, 'procession', 2)
insert into lst_vocab values (99, 'seminar', 2)
insert into lst_vocab values (100, 'particularly', 2)

insert into lst_vocab values (1, 'advocacy', 3)
insert into lst_vocab values (2, 'fertilizer', 3)
insert into lst_vocab values (3, 'cripple', 3)
insert into lst_vocab values (4, 'slope', 3)
insert into lst_vocab values (5, 'flaunt', 3)
insert into lst_vocab values (6, 'median', 3)
insert into lst_vocab values (7, 'salient', 3)
insert into lst_vocab values (8, 'literacy', 3)
insert into lst_vocab values (9, 'accordingly', 3)
insert into lst_vocab values (10, 'rejection', 3)
insert into lst_vocab values (11, 'spectator', 3)
insert into lst_vocab values (12, 'inefficient', 3)
insert into lst_vocab values (13, 'chaise', 3)
insert into lst_vocab values (14, 'fertilized', 3)
insert into lst_vocab values (15, 'companionate', 3)
insert into lst_vocab values (16, 'entity', 3)
insert into lst_vocab values (17, 'enumerate', 3)
insert into lst_vocab values (18, 'embalm', 3)
insert into lst_vocab values (19, 'composition', 3)
insert into lst_vocab values (20, 'epochal', 3)
insert into lst_vocab values (21, 'automatic', 3)
insert into lst_vocab values (22, 'seminal', 3)
insert into lst_vocab values (23, 'incandescent', 3)
insert into lst_vocab values (24, 'carcinogen', 3)
insert into lst_vocab values (25, 'bourgeois', 3)
insert into lst_vocab values (26, 'gourmet', 3)
insert into lst_vocab values (27, 'deduce', 3)
insert into lst_vocab values (28, 'indicator', 3)
insert into lst_vocab values (29, 'eradication', 3)
insert into lst_vocab values (30, 'deduct', 3)
insert into lst_vocab values (31, 'fuel', 3)
insert into lst_vocab values (32, 'misrepresent', 3)
insert into lst_vocab values (33, 'injection', 3)
insert into lst_vocab values (34, 'magnitude', 3)
insert into lst_vocab values (35, 'assertion', 3)
insert into lst_vocab values (36, 'evacuation', 3)
insert into lst_vocab values (37, 'confront', 3)
insert into lst_vocab values (38, 'exhaust', 3)
insert into lst_vocab values (39, 'whirl', 3)
insert into lst_vocab values (40, 'folklore', 3)
insert into lst_vocab values (41, 'neural', 3)
insert into lst_vocab values (42, 'addict', 3)
insert into lst_vocab values (43, 'discrepancy', 3)
insert into lst_vocab values (44, 'indiscriminate', 3)
insert into lst_vocab values (45, 'increment', 3)
insert into lst_vocab values (46, 'resign', 3)
insert into lst_vocab values (47, 'scent', 3)
insert into lst_vocab values (48, 'subsidy', 3)
insert into lst_vocab values (49, 'undercapitalize', 3)
insert into lst_vocab values (50, 'maturity', 3)
insert into lst_vocab values (51, 'embark', 3)
insert into lst_vocab values (52, 'mandate', 3)   
insert into lst_vocab values (53, 'deviate', 3)
insert into lst_vocab values (54, 'reside', 3)
insert into lst_vocab values (55, 'construction', 3)
insert into lst_vocab values (56, 'generational', 3)
insert into lst_vocab values (57, 'meld', 3)
insert into lst_vocab values (58, 'handlebar', 3)
insert into lst_vocab values (59, 'pivotal', 3)
insert into lst_vocab values (60, 'recall', 3)
insert into lst_vocab values (61, 'alien', 3)
insert into lst_vocab values (62, 'manufacturing', 3)
insert into lst_vocab values (63, 'personhood', 3)
insert into lst_vocab values (64, 'proviso', 3)
insert into lst_vocab values (65, 'subgroup', 3)
insert into lst_vocab values (66, 'calamitous', 3)
insert into lst_vocab values (67, 'wrap', 3)
insert into lst_vocab values (68, 'authentic', 3)
insert into lst_vocab values (69, 'contract', 3)
insert into lst_vocab values (70, 'graphite', 3)
insert into lst_vocab values (71, 'telephoto', 3)
insert into lst_vocab values (72, 'celestial', 3)
insert into lst_vocab values (73, 'errand', 3)
insert into lst_vocab values (74, 'interstellar', 3)
insert into lst_vocab values (75, 'corresponding', 3)
insert into lst_vocab values (76, 'jeopardize', 3)
insert into lst_vocab values (77, 'avian', 3)
insert into lst_vocab values (78, 'instrument', 3)
insert into lst_vocab values (79, 'pervasive', 3)
insert into lst_vocab values (80, 'commodity', 3)
insert into lst_vocab values (81, 'wield', 3)
insert into lst_vocab values (82, 'speculate', 3)
insert into lst_vocab values (83, 'fluid', 3)
insert into lst_vocab values (84, 'shelter', 3)
insert into lst_vocab values (85, 'potter', 3)
insert into lst_vocab values (86, 'appeal', 3)
insert into lst_vocab values (87, 'futile', 3)
insert into lst_vocab values (88, 'charter', 3)
insert into lst_vocab values (89, 'republican', 3)
insert into lst_vocab values (90, 'fuse', 3)
insert into lst_vocab values (91, 'seesaw', 3)
insert into lst_vocab values (92, 'snout', 3)
insert into lst_vocab values (93, 'undeterred', 3)
insert into lst_vocab values (94, 'prey', 3)
insert into lst_vocab values (95, 'iridescence', 3)
insert into lst_vocab values (96, 'scurrilous', 3)
insert into lst_vocab values (97, 'advocate', 3)
insert into lst_vocab values (98, 'abolish', 3)
insert into lst_vocab values (99, 'posit', 3)
insert into lst_vocab values (100, 'minimum', 3)

insert into lst_vocab values (1, 'hysteria', 4)
insert into lst_vocab values (2, 'disarm', 4)
insert into lst_vocab values (3, 'efface', 4)
insert into lst_vocab values (4, 'advocacy', 4)
insert into lst_vocab values (5, 'clutter', 4)
insert into lst_vocab values (6, 'zoom', 4)
insert into lst_vocab values (7, 'pitcher', 4)
insert into lst_vocab values (8, 'fertilizer', 4)
insert into lst_vocab values (9, 'indignation', 4)
insert into lst_vocab values (10, 'overbear', 4)
insert into lst_vocab values (11, 'petulant', 4)
insert into lst_vocab values (12, 'steadiness', 4)
insert into lst_vocab values (13, 'adaptable', 4)
insert into lst_vocab values (14, 'flaunt', 4)
insert into lst_vocab values (15, 'deviant', 4)
insert into lst_vocab values (16, 'serenade', 4)
insert into lst_vocab values (17, 'assertive', 4)
insert into lst_vocab values (18, 'spew', 4)
insert into lst_vocab values (19, 'reinstate', 4)
insert into lst_vocab values (20, 'atiquarianism', 4)
insert into lst_vocab values (21, 'monopolize', 4)
insert into lst_vocab values (22, 'salient', 4)
insert into lst_vocab values (23, 'constructive', 4)
insert into lst_vocab values (24, 'irreconcilable', 4)
insert into lst_vocab values (25, 'anathema', 4)
insert into lst_vocab values (26, 'retiring', 4)
insert into lst_vocab values (27, 'effeminate', 4)
insert into lst_vocab values (28, 'torrid', 4)
insert into lst_vocab values (29, 'resignation', 4)
insert into lst_vocab values (30, 'daze', 4)
insert into lst_vocab values (31, 'ignorance', 4)
insert into lst_vocab values (32, 'jaunt', 4)
insert into lst_vocab values (33, 'drip', 4)
insert into lst_vocab values (34, 'impractical', 4)
insert into lst_vocab values (35, 'meek', 4)
insert into lst_vocab values (36, 'finale', 4)
insert into lst_vocab values (37, 'twee', 4)
insert into lst_vocab values (38, 'inefficient', 4)
insert into lst_vocab values (39, 'caustic', 4)
insert into lst_vocab values (40, 'guise', 4)
insert into lst_vocab values (41, 'canonical', 4)
insert into lst_vocab values (42, 'grotesque', 4)
insert into lst_vocab values (43, 'cephalic', 4)
insert into lst_vocab values (44, 'debatable', 4)
insert into lst_vocab values (45, 'lamentable', 4)
insert into lst_vocab values (46, 'crouch', 4)
insert into lst_vocab values (47, 'airborne', 4)
insert into lst_vocab values (48, 'erupt', 4)
insert into lst_vocab values (49, 'blameworthy', 4)
insert into lst_vocab values (50, 'amalgamate', 4)
insert into lst_vocab values (51, 'dentures', 4)
insert into lst_vocab values (52, 'clairvoyant', 4)
insert into lst_vocab values (53, 'nonentity', 4)
insert into lst_vocab values (54, 'rectify', 4)
insert into lst_vocab values (55, 'extremity', 4)
insert into lst_vocab values (56, 'jab', 4)
insert into lst_vocab values (57, 'duplicitous', 4)
insert into lst_vocab values (58, 'grandiose', 4)
insert into lst_vocab values (59, 'censorious', 4)
insert into lst_vocab values (60, 'inflexible', 4)
insert into lst_vocab values (61, 'solitude', 4)
insert into lst_vocab values (62, 'futility', 4)
insert into lst_vocab values (63, 'whiff', 4)
insert into lst_vocab values (64, 'anthem', 4)
insert into lst_vocab values (65, 'affectionate', 4)
insert into lst_vocab values (66, 'guilt', 4)
insert into lst_vocab values (67, 'coagulation', 4)
insert into lst_vocab values (68, 'spat', 4)
insert into lst_vocab values (69, 'extremist', 4)
insert into lst_vocab values (70, 'renovate', 4)
insert into lst_vocab values (71, 'timid', 4)
insert into lst_vocab values (72, 'muck', 4)
insert into lst_vocab values (73, 'imprecise', 4)
insert into lst_vocab values (74, 'weary', 4)
insert into lst_vocab values (75, 'inveterate', 4)
insert into lst_vocab values (76, 'writ', 4)
insert into lst_vocab values (77, 'resonant', 4)
insert into lst_vocab values (78, 'generous', 4)
insert into lst_vocab values (79, 'sequential', 4)
insert into lst_vocab values (80, 'ruthless', 4)
insert into lst_vocab values (81, 'bravado', 4)
insert into lst_vocab values (82, 'dehumanize', 4)
insert into lst_vocab values (83, 'tawdry', 4)
insert into lst_vocab values (84, 'espy', 4)
insert into lst_vocab values (85, 'magniloquent', 4)
insert into lst_vocab values (86, 'versant', 4)
insert into lst_vocab values (87, 'depose', 4)
insert into lst_vocab values (88, 'magnitude', 4)
insert into lst_vocab values (89, 'brittle', 4)
insert into lst_vocab values (90, 'foolproof', 4)
insert into lst_vocab values (91, 'wicked', 4)
insert into lst_vocab values (92, 'peruse', 4)
insert into lst_vocab values (93, 'convoy', 4)
insert into lst_vocab values (94, 'flush', 4)
insert into lst_vocab values (95, 'raspy', 4)
insert into lst_vocab values (96, 'deprecatory', 4)
insert into lst_vocab values (97, 'suspicious', 4)
insert into lst_vocab values (98, 'enfetter', 4)
insert into lst_vocab values (99, 'hasty', 4)
insert into lst_vocab values (100, 'backside', 4)

insert into lst_vocab values (1, 'pharmacy', 5)
insert into lst_vocab values (2, 'plastic', 5)
insert into lst_vocab values (3, 'zoom', 5)
insert into lst_vocab values (4, 'profession', 5)
insert into lst_vocab values (5, 'treason', 5)
insert into lst_vocab values (6, 'astronaut', 5)
insert into lst_vocab values (7, 'fertilizer', 5)
insert into lst_vocab values (8, 'indignation', 5)
insert into lst_vocab values (9, 'augment', 5)
insert into lst_vocab values (10, 'religion', 5)
insert into lst_vocab values (11, 'celebrity', 5)
insert into lst_vocab values (12, 'cripple', 5)
insert into lst_vocab values (13, 'degenerate', 5)
insert into lst_vocab values (14, 'asset', 5)
insert into lst_vocab values (15, 'gasoline', 5)
insert into lst_vocab values (16, 'heel', 5)
insert into lst_vocab values (17, 'sleeve', 5)
insert into lst_vocab values (18, 'evolution', 5)
insert into lst_vocab values (19, 'toll', 5)
insert into lst_vocab values (20, 'scrape', 5)
insert into lst_vocab values (21, 'stadium', 5)
insert into lst_vocab values (22, 'slope', 5)
insert into lst_vocab values (23, 'salient', 5)
insert into lst_vocab values (24, 'tomb', 5)
insert into lst_vocab values (25, 'literacy', 5)
insert into lst_vocab values (26, 'dissipate', 5)
insert into lst_vocab values (27, 'imaginary', 5)
insert into lst_vocab values (28, 'ignoreance', 5)
insert into lst_vocab values (29, 'aesthetic', 5)
insert into lst_vocab values (30, 'tone', 5)
insert into lst_vocab values (31, 'censorship', 5)
insert into lst_vocab values (32, 'grope', 5)
insert into lst_vocab values (33, 'erupt', 5)
insert into lst_vocab values (34, 'suffer', 5)
insert into lst_vocab values (35, 'situated', 5)
insert into lst_vocab values (36, 'analyze', 5)
insert into lst_vocab values (37, 'expertise', 5)
insert into lst_vocab values (38, 'legend', 5)
insert into lst_vocab values (39, 'rectify', 5)
insert into lst_vocab values (40, 'safeguard', 5)
insert into lst_vocab values (41, 'debut', 5)
insert into lst_vocab values (42, 'medieval', 5)
insert into lst_vocab values (43, 'zone', 5)
insert into lst_vocab values (44, 'consumption', 5)
insert into lst_vocab values (45, 'description', 5)
insert into lst_vocab values (46, 'invalid', 5)
insert into lst_vocab values (47, 'plater', 5)
insert into lst_vocab values (48, 'jam', 5)
insert into lst_vocab values (49, 'guilt', 5)
insert into lst_vocab values (50, 'reciprocal', 5)
insert into lst_vocab values (51, 'verge', 5)
insert into lst_vocab values (52, 'prophet', 5)
insert into lst_vocab values (53, 'rap', 5)
insert into lst_vocab values (54, 'organize', 5)
insert into lst_vocab values (55, 'isturb', 5)
insert into lst_vocab values (56, 'rat', 5)
insert into lst_vocab values (57, 'criticism', 5)
insert into lst_vocab values (58, 'heir', 5)
insert into lst_vocab values (59, 'jaw', 5)
insert into lst_vocab values (60, 'shampoo', 5)
insert into lst_vocab values (61, 'following', 5)
insert into lst_vocab values (62, 'supplement', 5)
insert into lst_vocab values (63, 'repression', 5)
insert into lst_vocab values (64, 'alike', 5)
insert into lst_vocab values (65, 'axis', 5)
insert into lst_vocab values (66, 'cellar', 5)
insert into lst_vocab values (67, 'conductor', 5)
insert into lst_vocab values (68, 'colleague', 5)
insert into lst_vocab values (69, 'peach', 5)
insert into lst_vocab values (70, 'orthidox', 5)
insert into lst_vocab values (71, 'minimize', 5)
insert into lst_vocab values (72, 'brittle', 5)
insert into lst_vocab values (73, 'hinder', 5)
insert into lst_vocab values (74, 'gram', 5)
insert into lst_vocab values (75, 'dominate', 5)
insert into lst_vocab values (76, 'siren', 5)
insert into lst_vocab values (77, 'dine', 5)
insert into lst_vocab values (78, 'entire', 5)
insert into lst_vocab values (79, 'hasty', 5)
insert into lst_vocab values (80, 'liability', 5)
insert into lst_vocab values (81, 'amateur', 5)
insert into lst_vocab values (82, 'haste', 5)
insert into lst_vocab values (83, 'zeal', 5)
insert into lst_vocab values (84, 'tolerance', 5)
insert into lst_vocab values (85, 'border', 5)
insert into lst_vocab values (86, 'element', 5)
insert into lst_vocab values (87, 'odor', 5)
insert into lst_vocab values (88, 'elect', 5)
insert into lst_vocab values (89, 'rot', 5)
insert into lst_vocab values (90, 'lower', 5)
insert into lst_vocab values (91, 'riddle', 5)
insert into lst_vocab values (92, 'peculiar', 5)
insert into lst_vocab values (93, 'advantage', 5)
insert into lst_vocab values (94, 'rag', 5)
insert into lst_vocab values (95, 'female', 5)
insert into lst_vocab values (96, 'royal', 5)
insert into lst_vocab values (97, 'intermittent', 5)
insert into lst_vocab values (98, 'tiresome', 5)
insert into lst_vocab values (99, 'exhaust', 5)
insert into lst_vocab values (100, 'sunrise', 5)

insert into lst_vocab values (1, 'profession', 6)
insert into lst_vocab values (2, 'compete', 6)
insert into lst_vocab values (3, 'slope', 6)
insert into lst_vocab values (4, 'degenerate', 6)
insert into lst_vocab values (5, 'event', 6)
insert into lst_vocab values (6, 'advanced', 6)
insert into lst_vocab values (7, 'evolution', 6)
insert into lst_vocab values (8, 'steady', 6)
insert into lst_vocab values (9, 'literacy', 6)
insert into lst_vocab values (10, 'ignorance', 6)
insert into lst_vocab values (11, 'relief', 6)
insert into lst_vocab values (12, 'helix', 6)
insert into lst_vocab values (13, 'invisible', 6)
insert into lst_vocab values (14, 'invader', 6)
insert into lst_vocab values (15, 'timid', 6)
insert into lst_vocab values (16, 'imprecise', 6)
insert into lst_vocab values (17, 'miscellaneous', 6)
insert into lst_vocab values (18, 'deduce', 6)
insert into lst_vocab values (19, 'ruthless', 6)
insert into lst_vocab values (20, 'magnitude', 6)
insert into lst_vocab values (21, 'brittle', 6)
insert into lst_vocab values (22, 'confront', 6)
insert into lst_vocab values (23, 'entire', 6)
insert into lst_vocab values (24, 'flush', 6)
insert into lst_vocab values (25, 'bistro', 6)
insert into lst_vocab values (26, 'souvenir', 6)
insert into lst_vocab values (27, 'addict', 6)
insert into lst_vocab values (28, 'discrepancy', 6)
insert into lst_vocab values (29, 'border', 6)
insert into lst_vocab values (30, 'alight', 6)
insert into lst_vocab values (31, 'dolphin', 6)
insert into lst_vocab values (32, 'aerobics', 6)
insert into lst_vocab values (33, 'embody', 6)
insert into lst_vocab values (34, 'resign', 6)
insert into lst_vocab values (35, 'subsidy', 6)
insert into lst_vocab values (36, 'verification', 6)
insert into lst_vocab values (37, 'crossword', 6)
insert into lst_vocab values (38, 'roam', 6)
insert into lst_vocab values (39, 'maturity', 6)
insert into lst_vocab values (40, 'technician', 6)
insert into lst_vocab values (41, 'assistance', 6)
insert into lst_vocab values (42, 'publicity', 6)
insert into lst_vocab values (43, 'construction', 6)
insert into lst_vocab values (44, 'melt', 6)
insert into lst_vocab values (45, 'analyze', 6)
insert into lst_vocab values (46, 'ethereal', 6)
insert into lst_vocab values (47, 'spade', 6)
insert into lst_vocab values (48, 'formulate', 6)
insert into lst_vocab values (49, 'mess', 6)
insert into lst_vocab values (50, 'calorie', 6)
insert into lst_vocab values (51, 'poisonous', 6)
insert into lst_vocab values (52, 'fumes', 6)
insert into lst_vocab values (53, 'authentic', 6)
insert into lst_vocab values (54, 'thorny', 6)
insert into lst_vocab values (55, 'tutorial', 6)
insert into lst_vocab values (56, 'infringe', 6)
insert into lst_vocab values (57, 'orientate', 6)
insert into lst_vocab values (58, 'maximise', 6)
insert into lst_vocab values (59, 'mere', 6)
insert into lst_vocab values (60, 'violent', 6)
insert into lst_vocab values (61, 'celestial', 6)
insert into lst_vocab values (62, 'chest', 6)
insert into lst_vocab values (63, 'security', 6)
insert into lst_vocab values (64, 'encase', 6)
insert into lst_vocab values (65, 'skyscraper', 6)
insert into lst_vocab values (66, 'gorgeous', 6)
insert into lst_vocab values (67, 'drum', 6)
insert into lst_vocab values (68, 'broom', 6)
insert into lst_vocab values (69, 'brood', 6)
insert into lst_vocab values (70, 'pervasive', 6)
insert into lst_vocab values (71, 'instrument', 6)
insert into lst_vocab values (72, 'commodity', 6)
insert into lst_vocab values (73, 'slander', 6)
insert into lst_vocab values (74, 'advance', 6)
insert into lst_vocab values (75, 'replenish', 6)
insert into lst_vocab values (76, 'enslave', 6)
insert into lst_vocab values (77, 'appear', 6)
insert into lst_vocab values (78, 'clinic', 6)
insert into lst_vocab values (79, 'speculate', 6)
insert into lst_vocab values (80, 'swivel', 6)
insert into lst_vocab values (81, 'shelter', 6)
insert into lst_vocab values (82, 'insidious', 6)
insert into lst_vocab values (83, 'appeal', 6)
insert into lst_vocab values (84, 'cheat', 6)
insert into lst_vocab values (85, 'fuse', 6)
insert into lst_vocab values (86, 'futile', 6)
insert into lst_vocab values (87, 'prey', 6)
insert into lst_vocab values (88, 'suggest', 6)
insert into lst_vocab values (89, 'commence', 6)
insert into lst_vocab values (90, 'abolish', 6)
insert into lst_vocab values (91, 'machinery', 6)
insert into lst_vocab values (92, 'laundry', 6)
insert into lst_vocab values (93, 'iron', 6)
insert into lst_vocab values (94, 'absolute', 6)
insert into lst_vocab values (95, 'sore', 6)
insert into lst_vocab values (96, 'unquote', 6)
insert into lst_vocab values (97, 'sensitive', 6)
insert into lst_vocab values (98, 'contrary', 6)
insert into lst_vocab values (99, 'gland', 6)
insert into lst_vocab values (100, 'assignment', 6)

insert into lst_vocab values (1, 'incentive', 7)
insert into lst_vocab values (2, 'calculate', 7)
insert into lst_vocab values (3, 'profession', 7)
insert into lst_vocab values (4, 'shatter', 7)
insert into lst_vocab values (5, 'indignation', 7)
insert into lst_vocab values (6, 'fertilizer', 7)
insert into lst_vocab values (7, 'olive', 7)
insert into lst_vocab values (8, 'compete', 7)
insert into lst_vocab values (9, 'religion', 7)
insert into lst_vocab values (10, 'furnish', 7)
insert into lst_vocab values (11, 'crippe', 7)
insert into lst_vocab values (12, 'autonomy', 7)
insert into lst_vocab values (13, 'degenerate', 7)
insert into lst_vocab values (14, 'slope', 7)
insert into lst_vocab values (15, 'sprinkle', 7)
insert into lst_vocab values (16, 'banquet', 7)
insert into lst_vocab values (17, 'alternate', 7)
insert into lst_vocab values (18, 'essential', 7)
insert into lst_vocab values (19, 'asset', 7)
insert into lst_vocab values (20, 'comic', 7)
insert into lst_vocab values (21, 'texture', 7)
insert into lst_vocab values (22, 'heel', 7)
insert into lst_vocab values (23, 'differentiate', 7)
insert into lst_vocab values (24, 'deadly', 7)
insert into lst_vocab values (25, 'partial', 7)
insert into lst_vocab values (26, 'evolution', 7)
insert into lst_vocab values (27, 'toll', 7)
insert into lst_vocab values (28, 'assertive', 7)
insert into lst_vocab values (29, 'junction', 7)
insert into lst_vocab values (30, 'paradox', 7)
insert into lst_vocab values (31, 'scrape', 7)
insert into lst_vocab values (32, 'array', 7)
insert into lst_vocab values (33, 'dynamic', 7)
insert into lst_vocab values (34, 'literacy', 7)
insert into lst_vocab values (35, 'moral', 7)
insert into lst_vocab values (36, 'irrespective', 7)
insert into lst_vocab values (37, 'behavior', 7)
insert into lst_vocab values (38, 'justify', 7)
insert into lst_vocab values (39, 'dissipate', 7)
insert into lst_vocab values (40, 'vivid', 7)
insert into lst_vocab values (41, 'rejection', 7)
insert into lst_vocab values (42, 'spectator', 7)
insert into lst_vocab values (43, 'relief', 7)
insert into lst_vocab values (44, 'fantasy', 7)
insert into lst_vocab values (45, 'transform', 7)
insert into lst_vocab values (46, 'aesthetic', 7)
insert into lst_vocab values (47, 'suburb', 7)
insert into lst_vocab values (48, 'token', 7)
insert into lst_vocab values (49, 'notation', 7)
insert into lst_vocab values (50, 'trial', 7)
insert into lst_vocab values (51, 'sophisticated', 7)
insert into lst_vocab values (52, 'tragic', 7)
insert into lst_vocab values (53, 'ignore', 7)
insert into lst_vocab values (54, 'ridiculous', 7)
insert into lst_vocab values (55, 'illegal', 7)
insert into lst_vocab values (56, 'invisible', 7)
insert into lst_vocab values (57, 'tribe', 7)
insert into lst_vocab values (58, 'grope', 7)
insert into lst_vocab values (59, 'drainage', 7)
insert into lst_vocab values (60, 'hazard', 7)
insert into lst_vocab values (61, 'erupt', 7)
insert into lst_vocab values (62, 'consultant', 7)
insert into lst_vocab values (63, 'distill', 7)
insert into lst_vocab values (64, 'situated', 7)
insert into lst_vocab values (65, 'expertise', 7)
insert into lst_vocab values (66, 'legend', 7)
insert into lst_vocab values (67, 'predict', 7)
insert into lst_vocab values (68, 'hinge', 7)
insert into lst_vocab values (69, 'rectify', 7)
insert into lst_vocab values (70, 'safeguard', 7)
insert into lst_vocab values (71, 'ballet', 7)
insert into lst_vocab values (72, 'medieval', 7)
insert into lst_vocab values (73, 'interpersonal', 7)
insert into lst_vocab values (74, 'rehearsal', 7)
insert into lst_vocab values (75, 'basis', 7)
insert into lst_vocab values (76, 'reluctant', 7)
insert into lst_vocab values (77, 'exemplary', 7)
insert into lst_vocab values (78, 'resistant', 7)
insert into lst_vocab values (79, 'consumption', 7)
insert into lst_vocab values (80, 'infant', 7)
insert into lst_vocab values (81, 'exception', 7)
insert into lst_vocab values (82, 'entity', 7)
insert into lst_vocab values (83, 'precedent', 7)
insert into lst_vocab values (84, 'consumer', 7)
insert into lst_vocab values (85, 'surgery', 7)
insert into lst_vocab values (86, 'compact', 7)
insert into lst_vocab values (87, 'invalid', 7)
insert into lst_vocab values (88, 'pessimistic', 7)
insert into lst_vocab values (89, 'priority', 7)
insert into lst_vocab values (90, 'reputation', 7)
insert into lst_vocab values (91, 'plaster', 7)
insert into lst_vocab values (92, 'processing', 7)
insert into lst_vocab values (93, 'provocative', 7)
insert into lst_vocab values (94, 'aggravate', 7)
insert into lst_vocab values (95, 'reciprocal', 7)
insert into lst_vocab values (96, 'execute', 7)
insert into lst_vocab values (97, 'verge', 7)
insert into lst_vocab values (98, 'pumpkin', 7)
insert into lst_vocab values (99, 'notable', 7)
insert into lst_vocab values (100, 'automatic', 7)

insert into lst_vocab values (1, 'efface', 8)
insert into lst_vocab values (2, 'advocacy', 8)
insert into lst_vocab values (3, 'clutter', 8)
insert into lst_vocab values (4, 'profession', 8)
insert into lst_vocab values (5, 'bravo', 8)
insert into lst_vocab values (6, 'unaccountable', 8)
insert into lst_vocab values (7, 'laborious', 8)
insert into lst_vocab values (8, 'petulant', 8)
insert into lst_vocab values (9, 'degenerate', 8)
insert into lst_vocab values (10, 'slope', 8)
insert into lst_vocab values (11, 'volant', 8)
insert into lst_vocab values (12, 'chimerical', 8)
insert into lst_vocab values (13, 'gasoline', 8)
insert into lst_vocab values (14, 'hindrance', 8)
insert into lst_vocab values (15, 'flaunt', 8)
insert into lst_vocab values (16, 'evolution', 8)
insert into lst_vocab values (17, 'assertive', 8)
insert into lst_vocab values (18, 'median', 8)
insert into lst_vocab values (19, 'salient', 8)
insert into lst_vocab values (20, 'constructive', 8)
insert into lst_vocab values (21, 'anathema', 8)
insert into lst_vocab values (22, 'retrograde', 8)
insert into lst_vocab values (23, 'torrid', 8)
insert into lst_vocab values (24, 'effeminate', 8)
insert into lst_vocab values (25, 'resignation', 8)
insert into lst_vocab values (26, 'literacy', 8)
insert into lst_vocab values (27, 'caustic', 8)
insert into lst_vocab values (28, 'timer', 8)
insert into lst_vocab values (29, 'helix', 8)
insert into lst_vocab values (30, 'canonical', 8)
insert into lst_vocab values (31, 'guise', 8)
insert into lst_vocab values (32, 'censorship', 8)
insert into lst_vocab values (33, 'consultant', 8)
insert into lst_vocab values (34, 'automation', 8)
insert into lst_vocab values (35, 'analyze', 8)
insert into lst_vocab values (36, 'resonate', 8)
insert into lst_vocab values (37, 'safeguard', 8)
insert into lst_vocab values (38, 'rectify', 8)
insert into lst_vocab values (39, 'braze', 8)
insert into lst_vocab values (40, 'suspend', 8)
insert into lst_vocab values (41, 'entity', 8)
insert into lst_vocab values (42, 'grandiose', 8)
insert into lst_vocab values (43, 'censorious', 8)
insert into lst_vocab values (44, 'enumerate', 8)
insert into lst_vocab values (45, 'echo', 8)
insert into lst_vocab values (46, 'antediluvian', 8)
insert into lst_vocab values (47, 'gourmet', 8)
insert into lst_vocab values (48, 'rationalize', 8)
insert into lst_vocab values (49, 'append', 8)
insert into lst_vocab values (50, 'sulfur disoxide', 8)
insert into lst_vocab values (51, 'renovate', 8)
insert into lst_vocab values (52, 'incandescent', 8)
insert into lst_vocab values (53, 'canine', 8)
insert into lst_vocab values (54, 'seminar', 8)
insert into lst_vocab values (55, 'deduce', 8)
insert into lst_vocab values (56, 'column', 8)
insert into lst_vocab values (57, 'inveterate', 8)
insert into lst_vocab values (58, 'indicator', 8)
insert into lst_vocab values (59, 'deduct', 8)
insert into lst_vocab values (60, 'brightness', 8)
insert into lst_vocab values (61, 'mordacious', 8)
insert into lst_vocab values (62, 'ruthless', 8)
insert into lst_vocab values (63, 'bravado', 8)
insert into lst_vocab values (64, 'tawdry', 8)
insert into lst_vocab values (65, 'espy', 8)
insert into lst_vocab values (66, 'misrepresent', 8)
insert into lst_vocab values (67, 'conductor', 8)
insert into lst_vocab values (68, 'inefficacious', 8)
insert into lst_vocab values (69, 'travail', 8)
insert into lst_vocab values (70, 'magnitude', 8)
insert into lst_vocab values (71, 'assignee', 8)
insert into lst_vocab values (72, 'brittle', 8)
insert into lst_vocab values (73, 'assertion', 8)
insert into lst_vocab values (74, 'peruse', 8)
insert into lst_vocab values (75, 'confront', 8)
insert into lst_vocab values (76, 'deport', 8)
insert into lst_vocab values (77, 'ludicrous', 8)
insert into lst_vocab values (78, 'exhaust', 8)
insert into lst_vocab values (79, 'suspicious', 8)
insert into lst_vocab values (80, 'souvenir', 8)
insert into lst_vocab values (81, 'recumbent', 8)
insert into lst_vocab values (82, 'neural', 8)
insert into lst_vocab values (83, 'sealant', 8)
insert into lst_vocab values (84, 'subside', 8)
insert into lst_vocab values (85, 'haste', 8)
insert into lst_vocab values (86, 'numeration', 8)
insert into lst_vocab values (87, 'zeal', 8)
insert into lst_vocab values (88, 'testimonial', 8)
insert into lst_vocab values (89, 'rationality', 8)
insert into lst_vocab values (90, 'indiscrimisnate', 8)
insert into lst_vocab values (91, 'alight', 8)
insert into lst_vocab values (92, 'upturn', 8)
insert into lst_vocab values (93, 'sterling', 8)
insert into lst_vocab values (94, 'obstinate', 8)
insert into lst_vocab values (95, 'embody', 8)
insert into lst_vocab values (96, 'recant', 8)
insert into lst_vocab values (97, 'interpreter', 8)
insert into lst_vocab values (98, 'verification', 8)
insert into lst_vocab values (99, 'brusque', 8)
insert into lst_vocab values (100, 'cathode', 8)

insert into lst_vocab values (1, 'disarm', 9)
insert into lst_vocab values (2, 'profession', 9)
insert into lst_vocab values (3, 'laborious', 9)
insert into lst_vocab values (4, 'sledding', 9)
insert into lst_vocab values (5, 'slope', 9)
insert into lst_vocab values (6, 'degenerate', 9)
insert into lst_vocab values (7, 'adaptable', 9)
insert into lst_vocab values (8, 'advanced', 9)
insert into lst_vocab values (9, 'gasoline', 9)
insert into lst_vocab values (10, 'deviant', 9)
insert into lst_vocab values (11, 'evolution', 9)
insert into lst_vocab values (12, 'dawn', 9)
insert into lst_vocab values (13, 'spew', 9)
insert into lst_vocab values (14, 'salient', 9)
insert into lst_vocab values (15, 'stadium', 9)
insert into lst_vocab values (16, 'steady', 9)
insert into lst_vocab values (17, 'literacy', 9)
insert into lst_vocab values (18, 'mathematics', 9)
insert into lst_vocab values (19, 'spectator', 9)
insert into lst_vocab values (20, 'relief', 9)
insert into lst_vocab values (21, 'lettuce', 9)
insert into lst_vocab values (22, 'notation', 9)
insert into lst_vocab values (23, 'domicile', 9)
insert into lst_vocab values (24, 'debatable', 9)
insert into lst_vocab values (25, 'airborne', 9)
insert into lst_vocab values (26, 'erupt', 9)
insert into lst_vocab values (27, 'well-heeled', 9)
insert into lst_vocab values (28, 'analyze', 9)
insert into lst_vocab values (29, 'orchid', 9)
insert into lst_vocab values (30, 'rectify', 9)
insert into lst_vocab values (31, 'zone', 9)
insert into lst_vocab values (32, 'suspend', 9)
insert into lst_vocab values (33, 'constricted', 9)
insert into lst_vocab values (34, 'extremity', 9)
insert into lst_vocab values (35, 'basin', 9)
insert into lst_vocab values (36, 'consumption', 9)
insert into lst_vocab values (37, 'entity', 9)
insert into lst_vocab values (38, 'infant', 9)
insert into lst_vocab values (39, 'solitude', 9)
insert into lst_vocab values (40, 'basic', 9)
insert into lst_vocab values (41, 'jar', 9)
insert into lst_vocab values (42, 'gourmet', 9)
insert into lst_vocab values (43, 'apprehend', 9)
insert into lst_vocab values (44, 'automatic', 9)
insert into lst_vocab values (45, 'renovate', 9)
insert into lst_vocab values (46, 'align', 9)
insert into lst_vocab values (47, 'resist', 9)
insert into lst_vocab values (48, 'jaw', 9)
insert into lst_vocab values (49, 'seminar', 9)
insert into lst_vocab values (50, 'imprecise', 9)
insert into lst_vocab values (51, 'column', 9)
insert into lst_vocab values (52, 'brass', 9)
insert into lst_vocab values (53, 'span', 9)
insert into lst_vocab values (54, 'deduct', 9)
insert into lst_vocab values (55, 'generous', 9)
insert into lst_vocab values (56, 'sequential', 9)
insert into lst_vocab values (57, 'ruthless', 9)
insert into lst_vocab values (58, 'twig', 9)
insert into lst_vocab values (59, 'alike', 9)
insert into lst_vocab values (60, 'depose', 9)
insert into lst_vocab values (61, 'cellist', 9)
insert into lst_vocab values (62, 'magnitude', 9)
insert into lst_vocab values (63, 'minimize', 9)
insert into lst_vocab values (64, 'brittle', 9)
insert into lst_vocab values (65, 'evacuation', 9)
insert into lst_vocab values (66, 'confront', 9)
insert into lst_vocab values (67, 'deport', 9)
insert into lst_vocab values (68, 'exhaust', 9)
insert into lst_vocab values (69, 'suspicious', 9)
insert into lst_vocab values (70, 'riddle', 9)
insert into lst_vocab values (71, 'souvenir', 9)
insert into lst_vocab values (72, 'folklore', 9)
insert into lst_vocab values (73, 'haste', 9)
insert into lst_vocab values (74, 'capability', 9)
insert into lst_vocab values (75, 'rationality', 9)
insert into lst_vocab values (76, 'dolphin', 9)
insert into lst_vocab values (77, 'increment', 9)
insert into lst_vocab values (78, 'aerobics', 9)
insert into lst_vocab values (79, 'embody', 9)
insert into lst_vocab values (80, 'resign', 9)
insert into lst_vocab values (81, 'scent', 9)
insert into lst_vocab values (82, 'subsidy', 9)
insert into lst_vocab values (83, 'weave', 9)
insert into lst_vocab values (84, 'scene', 9)
insert into lst_vocab values (85, 'roam', 9)
insert into lst_vocab values (86, 'maturity', 9)
insert into lst_vocab values (87, 'embark', 9)
insert into lst_vocab values (88, 'memo', 9)
insert into lst_vocab values (89, 'assistance', 9)
insert into lst_vocab values (90, 'muse', 9)
insert into lst_vocab values (91, 'mandate', 9)
insert into lst_vocab values (92, 'enunciate', 9)
insert into lst_vocab values (93, 'jog', 9)
insert into lst_vocab values (94, 'reside', 9)
insert into lst_vocab values (95, 'jot', 9)
insert into lst_vocab values (96, 'costruction', 9)
insert into lst_vocab values (97, 'melt', 9)
insert into lst_vocab values (98, 'subconscious', 9)
insert into lst_vocab values (99, 'degenerative', 9)
insert into lst_vocab values (100, 'recall', 9)

SET ANSI_WARNINGS ON;

/* Proc_GetGrammarTenseByTenseID */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetGrammarTenseByTenseID](@tenseID int)
as
select * from grammar_tense where TenseID=@tenseID
GO

/* Proc_GetAllGrammarTenses */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetAllGrammarTenses]
as
select TenseID, Name, EnName from grammar_tense 
GO

/* Proc_GetAllGrammarTitle */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetAllGrammarTitle]
as
select * from lst_grammar_title
GO

/* Proc_GetAllWishTypes */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetAllWishTypes]
as
select * from lst_wish_types
GO

/* Proc_GetAllVocabTopic */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetAllVocabTopic]
as
select * from lst_vocab_topic
GO

/* Proc_GetVocabByTopic */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetVocabByTopic](@topicID int)
as
select * from lst_vocab where TopicID=@topicID
GO

/* Proc_GetWishSentence */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetWishSentence](@ID int)
as
select * from lst_wish_sentence_content where ID=@ID
GO

/* Proc_GetConditionalSentenceTypes */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetConditionalSentenceTypes](@ID int)
as
select * from conditional_sentence_type where ID=@ID
GO

--create table user--
CREATE TABLE [dbo].[UserAccount](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserLoginName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED ([UserID] ASC) 
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
	ON [PRIMARY]
) ON [PRIMARY]

--insert values into [dbo].[UserAccount]
set IDENTITY_INSERT UserAccount on
insert into [dbo].[UserAccount] ([UserID], [UserLoginName], [Password], [Email]) values(1, 'anhthu', '123456', N'20520792@gm.uit.edu.vn');
set IDENTITY_INSERT UserAccount off
go

--create procedure User Signup--
create proc [dbo].[UserSignup](@userloginname nvarchar(100), @password nvarchar(100), @email nvarchar(100), @CurrentID int output)
as
	if(exists(select * from UserAccount where UserLoginName = @userloginname or Email = @email))
	begin
		set @CurrentID=-1
		return
	end
	insert into UserAccount(UserLoginName, Password, Email) values(@userloginname, @password, @email)
	set @CurrentID=@@IDENTITY
GO
select * from UserAccount


--create procedure User Login--
create proc [dbo].[UserSignin](@email nvarchar(100), @password nvarchar(100))
as
	select * from UserAccount where Email = @email and Password = @password
GO
--create procedure User Update--
CREATE PROC [dbo].[UpdateAccount](@userid int, @userloginname nvarchar(100), @email nvarchar(100), @CurrentID int output)
as
begin try
	if(exists(select * from UserAccount where UserID<>@userid))
	begin
		set @CurrentID=-1
		return
	end
	update UserAccount set UserLoginName = @userloginname, Email = @email
	where UserID=@userid
	set @CurrentID=@userid
end try
begin catch
	set @CurrentID=0
end catch

exec UpdateAccount @userid = 1, @userloginname = 'vivivi', @email = 'vi', @CurrentID = @userid