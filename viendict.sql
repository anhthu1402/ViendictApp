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
	[Img] varchar(50) null,
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
	[Learnt] nvarchar(50) null,
	[TotalWords] int null,
	Primary key (LessonID, TopicID),
)

/*create table lst_study_topic_vocab*/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lst_study_topic_vocab](
	[ID] [int] NOT NULL ,
	[Word] [nvarchar](100) NULL,
	[IPA] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Meaning] [nvarchar](max) NULL,
	[EnExample] [nvarchar](max) NULL,
	[ViExample] [nvarchar](max) NULL,
	[LessonID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
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
alter table lst_study_topic_vocab add constraint pk_lsttopicvocab primary key (ID, LessonID, TopicID)

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
insert into lst_study_topic (TopicID, Name, TotalLessons) values(1, N'900 từ vựng luyện IELTS', 50)
insert into lst_study_topic(TopicID, Name, TotalLessons) values(2, N'600 từ vựng TOEIC', 50)
insert into lst_study_topic(TopicID, Name, TotalLessons) values(3, N'1000 từ vựng TOEFL', 50)
SET ANSI_WARNINGS ON;
update lst_study_topic set Img='ielts900.png' where TopicID=1
update lst_study_topic set Img='toeic600.png' where TopicID=2
update lst_study_topic set Img='toefl1000.jpg' where TopicID=3
update lst_study_topic set TotalLessons=15
SET ANSI_WARNINGS OFF;
insert into lst_study_topic_lesson values(1, N'Health problems', 1) 
insert into lst_study_topic_lesson values(2, N'Academic subjects', 1)
insert into lst_study_topic_lesson values(3, N'Travel and adventure', 1) 
insert into lst_study_topic_lesson values(4, N'Dimensions', 1) 
insert into lst_study_topic_lesson values(5, N'City life', 1) 
insert into lst_study_topic_lesson values(6, N'Persuasion', 1) 
insert into lst_study_topic_lesson values(7, N'Cultural interests', 1) 
insert into lst_study_topic_lesson values(8, N'Contrast', 1) 
insert into lst_study_topic_lesson values(9, N'Problems and solutions', 1) 
insert into lst_study_topic_lesson values(10, N'Ideas', 1) 
insert into lst_study_topic_lesson values(11, N'Growing up 1', 1) 
insert into lst_study_topic_lesson values(12, N'Growing up 2', 1)
insert into lst_study_topic_lesson values(13, N'Mental and physical development 1', 1) 
insert into lst_study_topic_lesson values(14, N'Mental and physical development 2', 1) 
insert into lst_study_topic_lesson values(15, N'Keeping fit 1', 1) 

insert into lst_study_topic_lesson values(1, N'Contracts', 2) 
insert into lst_study_topic_lesson values(2, N'Marketing', 2) 
insert into lst_study_topic_lesson values(3, N'Warranties', 2) 
insert into lst_study_topic_lesson values(4, N'Business Planning', 2) 
insert into lst_study_topic_lesson values(5, N'Conferences', 2) 
insert into lst_study_topic_lesson values(6, N'Computers', 2) 
insert into lst_study_topic_lesson values(7, N'Office Technology', 2) 
insert into lst_study_topic_lesson values(8, N'Electronics', 2) 
insert into lst_study_topic_lesson values(9, N'Warranties', 2) 
insert into lst_study_topic_lesson values(10, N'Correspondence', 2) 
insert into lst_study_topic_lesson values(11, N'Job Adveritising And Recruitment', 2) 
insert into lst_study_topic_lesson values(12, N'Applying And Interviewing', 2) 
insert into lst_study_topic_lesson values(13, N'Hiring and training', 2) 
insert into lst_study_topic_lesson values(14, N'Salaries and Benefits', 2) 
insert into lst_study_topic_lesson values(15, N'Promotions, pensions and awards', 2) 

insert into lst_study_topic_lesson values(1, N'Food crops', 3)
insert into lst_study_topic_lesson values(2, N'Disaster', 3)
insert into lst_study_topic_lesson values(3, N'Evolution and migration', 3)
insert into lst_study_topic_lesson values(4, N'Petronleum alternatives', 3)
insert into lst_study_topic_lesson values(5, N'Time efficiency', 3)
insert into lst_study_topic_lesson values(6, N'Ancient life', 3)
insert into lst_study_topic_lesson values(7, N'Computers', 3)
insert into lst_study_topic_lesson values(8, N'Energy', 3)
insert into lst_study_topic_lesson values(9, N'Memory', 3)
insert into lst_study_topic_lesson values(10, N'Spirituality', 3)
insert into lst_study_topic_lesson values(11, N'illness', 3)
insert into lst_study_topic_lesson values(12, N'Surgery', 3)
insert into lst_study_topic_lesson values(13, N'Ghosts', 3)
insert into lst_study_topic_lesson values(14, N'Anthropology', 3)
insert into lst_study_topic_lesson values(15, N'Social inequality', 3)
SET ANSI_WARNINGS ON;
update lst_study_topic_lesson set TotalWords=20 where TopicID=1
update lst_study_topic_lesson set TotalWords=12 where TopicID=2
update lst_study_topic_lesson set TotalWords=20 where TopicID=3
update lst_study_topic_lesson set Learnt=N'Chưa hoàn thành'
SET ANSI_WARNINGS ON;

SET ANSI_WARNINGS OFF;
--Study Topic 1
insert into lst_study_topic_vocab values(1, 'addiction', N'/əˈdɪk.ʃən/', 'noun', N'sự nghiện, sự ham mê', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(2, 'drug', N'/drʌɡ/', 'noun', N'ma túy, thuốc', N'Baldness is one side effect of the drug.', N'Hói đầu là một tác dụng phụ của thuốc.', 1, 1)
insert into lst_study_topic_vocab values(3, 'allergy', N'/ˈæl.ə.dʒi/', 'noun', N'sự dị ứng, sự dị ứng đối với thuốc men hoặc thức ăn', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(4, 'treat', N'/triːt/', 'verb', N'Điều trị, chữa trị', N'You should treat different types of people in different ways', N'Bạn nên đối xử với những loại người khác nhau theo những cách khác nhau', 1, 1)
insert into lst_study_topic_vocab values(5, 'trigger', N'/ˈtrɪɡ.ə(r)/', 'verb', N'cò súng, gây ra', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(6, 'dehydration', N'/ˌdiː.haɪˈdreɪ.ʃən/', 'noun', N'sự khử hoặc mất nước', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(7, 'avoid', N'/əˈvɔɪd/', 'verb', N'tránh, tránh khỏi; hủy bỏ, bác bỏ', N'We must reduce the cost by half to avoid a budget deficit.', N'Chúng ta phải giảm chi phí xuống một nửa để tránh thâm hụt ngân sách', 1, 1)
insert into lst_study_topic_vocab values(8, 'disease', N'/dɪˈziːz/', 'noun', N'bệnh, căn bệnh', N'Cancer is now becoming the most common disease in society', N'Bệnh ung thư hiện nay đang trở thành căn bệnh phổ biến trong xã hội.', 1, 1)
insert into lst_study_topic_vocab values(9, 'transmit', N'/trænzˈmɪt/', 'verb', N'lây nhiễm, truyền (bệnh)', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(10, 'diagnose', N'/ˌdaɪəɡˈnoʊs/', 'verb', N'chẩn đoán (bệnh); xác định (nguyên nhân của một vấn đề)', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(11, 'infection', N'/ɪnˈfek.ʃən/', 'noun', N'nhiễm trùng, sự nhiễm bệnh', N'Bacterial infection of the wound may occur.', N'Nhiễm trùng vết thương do vi khuẩn có thể xảy ra.', 1, 1)
insert into lst_study_topic_vocab values(12, 'bacterial', N'/bækˈtɪə.ri.əl/', 'adjective', N'(thuộc) vi khuẩn, do vi khuẩn', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(13, 'stroke', N'/strəʊk/', 'noun', N'đột quỵ, vuốt ve', N'He''s a beautiful dog. Can I stroke him?', N'Nó là một con chó đẹp. Tôi có thể vuốt ve nó không?', 1, 1)
insert into lst_study_topic_vocab values(14, 'administer', N'/ədˈmɪn.ɪ.stər/', 'verb', N'cấp (thuốc), cho dùng', N'', N'', 1, 1)
insert into lst_study_topic_vocab values(15, 'examine', N'/ɪɡˈzæmɪn/', 'verb', N'kiểm tra, hỏi thi', N'The police are keen to stop and examine that unbelievable car', N'Cảnh sát muốn cho dừng và kiểm tra chiếc xe khả nghi đó', 1, 1)
insert into lst_study_topic_vocab values(16, 'vaccinate', N'/ˈvæksɪneɪt/', 'verb', N'chủng ngừa, tiêm chủng', N'All children under 6 years old are vaccinated for free.', N'Tất cả trẻ am dưới 6 tuổi được tiêm phòng miễn phí.', 1, 1)
insert into lst_study_topic_vocab values(17, 'cancer', N'/ˈkænsər/', 'noun', N'bệnh ung thư, (bệnh) ung thư', N'Most skin cancers are completely curable.', N'Hầu hết các bệnh ung thư da đều có thể chữa khỏi hoàn toàn.', 1, 1)
insert into lst_study_topic_vocab values(18, 'suffer', N'/ˈsʌfər/', 'verb', N'chịu đựng, gánh chịu', N'Many countries have been suffering due to the economic depression.', N'Nhiều quốc gia đang suy yếu đi vì tính trạng suy thoái kinh tế.', 1, 1)
insert into lst_study_topic_vocab values(19, 'donor', N'/ˈdəʊ.nər/', 'noun', N'người cho, người hiến', N'She was overwhelmed with joy when she found out that she had an organ donor', N'Cô ấy ngập tràn niềm vui khi phát hiện ra mình được hiến tặng nội tạng', 1, 1)
insert into lst_study_topic_vocab values(20, 'tobacco', N'/təˈbækəʊ/', 'noun', N'thuốc lá, cây thuốc lá', N'Several different tobaccos are grown on the land.', N'Một số loại thuốc lá khác nhau được trồng trên đất.', 1, 1)

insert into lst_study_topic_vocab values(1, 'archaeology', N'/ˌɑː.kiˈɒl.ə.dʒi/', 'noun', N'khảo cổ học', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(2, 'lecturer', N'/ˈlek.tʃər.ər/', 'noun', N'thuyết trình viên (phải dẻo mỏ, tự tin, body, face chuẩn không cần chỉnh)', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(3, 'department', N'/dɪˈpɑːtmənt/', 'noun', N'ban, khoa, ngành', N'I''m a student enrolled in the English department.', N'Tôi là một học viên ở khoa Anh.', 2, 1)
insert into lst_study_topic_vocab values(4, 'professor', N'/prəˈfesər/', 'noun', N'giáo sư; giảng viên (đại học, cao đẳng)', N'The professor gave him advice on his dissertation.', N'Giảng viên đã đưa ra lời khuyên cho luận văn của cậu ấy.', 2, 1)
insert into lst_study_topic_vocab values(5, 'astronomy', N'/əˈstrɒn.ə.mi/', 'noun', N'thiên văn học', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(6, 'enthusiast', N'/ɪnˈθjuː.zi.æst/', 'noun', N'người say mê, người say mê một việc gì đó', N'He used to be enthusiastic at the beginning of the project.', N'Anh ta đã rất nhiệt tình lúc bắt đầu dự án.', 2, 1)
insert into lst_study_topic_vocab values(7, 'planetary', N'/ˈplæn.ɪ.ter.i/', 'adjective', N'(thuộc) hành tinh', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(8, 'economics', N'/ikəˈnɒmɪks/', 'noun', N'Nền kinh tế, kinh tế học', N'Economics is not an exact science.', N'Kinh tế học không phải là môn khoa học chính xác.', 2, 1)
insert into lst_study_topic_vocab values(9, 'geology', N'/dʒiˈɒl.ə.dʒi/', 'noun', N'địa chất, môn địa chất học', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(10, 'linguistics', N'/lɪŋˈɡwɪs.tɪks/', 'noun', N'ngôn ngữ học', N'Tim did a three-year course in linguistics at Newcastle.', N'Tim học một khóa ngôn ngữ 3 năm ở Newcastle.', 2, 1)
insert into lst_study_topic_vocab values(11, 'psychology', N'/saɪˈkɒlədʒi/', 'noun', N'tâm lý học, môn tâm lý học', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(12, 'sociology', N'/ˌsəʊ.siˈɒl.ə.dʒi/', 'noun', N'xã hội học', N'', N'', 2, 1)
insert into lst_study_topic_vocab values(13, 'analyse', N'/ˈæn.əl.aɪz/', 'verb', N'phân tích, (v) phân tích', N'The first step is to define and analyse the problem.', N'Bước đầu tiên là xác định và phân tích vấn đề.', 2, 1)
insert into lst_study_topic_vocab values(14, 'claim', N'/kleɪm/', 'verb', N'nói, tuyên bố', N'They claim that he is a liar.', N'Họ nói rằng anh ta là một kẻ lừa gạt.', 2, 1)
insert into lst_study_topic_vocab values(15, 'define', N'/dɪˈfaɪn/', 'verb', N'giải thích nghĩa; định nghĩa', N'They need to define the processes of their program.', N'Họ cần phải giải thích các quy trình trong chương trình của mình.', 2, 1)
insert into lst_study_topic_vocab values(16, 'law', N'/lɔː/', 'noun', N'luật, điều luật', N'We should create some laws to govern school attendance.', N'Chúng ta cần phải đưa ra một số luật cụ thể để quản lý việc chuyên cần.', 2, 1)
insert into lst_study_topic_vocab values(17, 'evaluate', N'/ɪˈvæljueɪt/', 'verb', N'đánh giá, định giá; ước lượng', N'Employees are evaluated on their merit and not on seniority.', N'Nhân viên được đánh giá theo công lao của họ và không theo thâm niên.', 2, 1)
insert into lst_study_topic_vocab values(18, 'theory', N'/ˈθɪri/', 'noun', N'lý thuyết, học thuyết', N'The researchers haven''t found any scientific evidence for the theory of magic.', N'Các nhà nghiên cứu vẫn chưa tìm ra bất kỳ bằng chứng nào về lý thuyết ma thuật.', 2, 1)
insert into lst_study_topic_vocab values(19, 'assay', N'/ˈəs.eɪ/', 'noun', N'bài tiểu luận, bài luận', N'You should rewrite your assay because your ideas are too general.', N'Em nên viết lại bài luận của mình bởi vì các ý kiến của em rất chung chung.', 2, 1)
insert into lst_study_topic_vocab values(20, 'maritime', N'/ˈmær.ɪ.taɪm/', 'adjective', N'(thuộc) biển; (thuộc) ngành hàng hải', N'', N'', 2, 1)

insert into lst_study_topic_vocab values(1, 'accompany', N'/əˈkʌm.pə.ni/', 'verb', N'đi theo, đi cùng', N'', N'', 3, 1)
insert into lst_study_topic_vocab values(2, 'delay', N'/dɪˈleɪ/', 'verb', N'trì hoãn; chậm trễ', N'She forgot to inform me of the meeting delay.', N'Cô ấy đã quên không thông báo cho tôi về việc hoãn cuộc họp.', 3, 1)
insert into lst_study_topic_vocab values(3, 'encounter', N'/ɪnˈkaʊn.tər/', 'verb', N'bắt gặp, gặp phải', N'Tourists can easily encounter a deer while visiting this site.', N'Khách du lịch có thể dễ dàng bắt gặp một chú nai khi đến thăm địa điểm này.', 3, 1)
insert into lst_study_topic_vocab values(4, 'overcome', N'/ˌəʊ.vəˈkʌm/', 'verb', N'vượt qua, khắc phục (khó khăn...)', N'Unity will help all of us overcome this difficult time, so stay close together and move forward.', N'Đoàn kết sẽ giúp tất cả chúng ta vượt qua thời kì khó khăn này, vì thế hãy sát cánh bên nhau và tiến lên.', 3, 1)
insert into lst_study_topic_vocab values(5, 'seek', N'/siːk/', 'verb', N'tìm, tìm kiếm', N'You should seek advice from your financial adviser before deciding on appropriate insurance cover.', N'Bạn nên tìm kiếm lời khuyên từ các chuyên gia tư vấn tài chính của bạn trước khi quyết định mua bảo hiểm thích hợp.', 3, 1)
insert into lst_study_topic_vocab values(6, 'approval', N'/əˈpruː.vl/', 'noun', N'sự đồng ý, sự chấp thuận', N'Several people nodded in approval.', N'Nhiều người gật đầu chấp thuận.', 3, 1)
insert into lst_study_topic_vocab values(7, 'challenge', N'/ˈtʃæl.ɪndʒ/', 'noun', N'sự thách thức, sự thử thách', N'A family must stick together to face the challenges of life.', N'Một gia đình phải đoàn kết với nhau để cùng đối mặt với những thách thức của cuộc sống.', 3, 1)
insert into lst_study_topic_vocab values(8, 'route', N'/ruːt/', 'noun', N'lộ trình, tuyến đường', N'Complacency is the route to disaster.', N'Tự mãn là con đường dẫn đến tai họa.', 3, 1)
insert into lst_study_topic_vocab values(9, 'trade', N'/treɪd/', 'noun', N'thương mại, mậu dịch', N'Trade unions are organizations that represent and protect workers at work.', N'Nghiệp đoàn là các tổ chức đại diện và bảo vệ công nhân tại nơi làm việc.', 3, 1)
insert into lst_study_topic_vocab values(10, 'intense', N'/ɪnˈtens/', 'adjective', N'dữ dội, mạnh', N'Students are in intense competition for getting accepted into prestigious universities.', N'Học sinh đang cạnh teanh căng thẳng để được vào học những trường đại học danh tiếng.', 3, 1)
insert into lst_study_topic_vocab values(11, 'pivotal', N'/ˈpɪv.ə.təl/', 'adjective', N'then chốt, mấu chốt', N'', N'', 3, 1)
insert into lst_study_topic_vocab values(12, 'position', N'/pəˈzɪʃn/', 'noun', N'vị trí, chỗ, thế, tư thế; địa vị, chức vụ', N'Are yu satisfied with your current position in the company?', N'Anh có hài lòng với vị trí hiện tại ở công ty không?', 3, 1)
insert into lst_study_topic_vocab values(13, 'profound', N'/prəˈfaʊnd/', 'adjective', N'sâu sắc, uyên thâm', N'Her sense of disappointment was profound.', N'Cảm giác thất vọng của cô rất sâu sắc.', 3, 1)
insert into lst_study_topic_vocab values(14, 'valuable', N'/ˈvæljuəbl/', 'adjective', N'có giá trị, đáng giá', N'Mary inherited a lot of valuable jewellery from her grandmother.', N'Mary được thừa hưởng rất nhiều trang sức quý báu từ bà của cô ấy.', 3, 1)
insert into lst_study_topic_vocab values(15, 'map', N'/mæp/', 'noun', N'bản đồ, (N) bản đồ', N'It''s right there on the map.', N'Nó ở ngay đó trên bản đồ.', 3, 1)
insert into lst_study_topic_vocab values(16, 'advice', N'/ədˈvaɪs/', 'noun', N'lời khuyên, (n) sự tư vấn', N'I always get the best advice from my father.', N'Tôi luôn có được những lời chỉ bảo tốt nhất từ bố.', 3, 1)
insert into lst_study_topic_vocab values(17, 'debate', N'/dɪˈbeɪt/', 'noun', N'cuộc thảo luận, tranh luận', N'Let''s debate the issues.', N'Hãy cùng tranh luận về các vấn đề này.', 3, 1)
insert into lst_study_topic_vocab values(18, 'item', N'/ˈaɪtəm/', 'noun', N'khoản, món, mục, mặt hàng', N'How many items are there in the box?', N'Có bao nhiêu món hàng trong chiếc hộp này?', 3, 1)
insert into lst_study_topic_vocab values(19, 'shock', N'/ʃɒk/', 'noun', N'cảm giác bất ngờ, cú sốc', N'His wife''s death has come as a great shock to him.', N'Cái chết của người vợ là một cú shock lớn với ông ta.', 3, 1)
insert into lst_study_topic_vocab values(20, 'community', N'/kəˈmjuːnəti/', 'noun', N'cộng đồng, (n) nhóm người', N'People in the community should help each other.', N'Mọi người trong cộng đồng nên giúp đỡ lẫn nhau.', 3, 1)

insert into lst_study_topic_vocab values(1, 'diameter', N'/daɪˈæmɪtər/', 'noun', N'đường kính', N'The inner diameter is easily adjusted.', N'Đường kính bên trong được điều chỉnh dễ dàng.', 4, 1)
insert into lst_study_topic_vocab values(2, 'circumference', N'/səˈkʌmfərəns/', 'noun', N'chu vi', N'', N'', 4, 1)
insert into lst_study_topic_vocab values(3, 'height', N'/haɪt/', 'noun', N'chiều cao, bề cao; độ cao', N'The average height of Vietnamese woman is 1.5 meters.', N'Chiều cao trung bình của phụ nữ Việt Nam là 1,5 mét.', 4, 1)
insert into lst_study_topic_vocab values(4, 'length', N'/leŋkθ/', 'noun', N'bề dài, chiều dài; độ dài', N'What is the length of this bridge?', N'Chiều dài của cây cầu này là bao nhiêu?', 4, 1)
insert into lst_study_topic_vocab values(5, 'measure', N'/ˈmeʒər/', 'verb', N'đo, đo lường', N'This device is to measure the water level, so we know how much is in the lake.', N'Thiết bị này dùng để đo mực nước, nhờ thế chúng ta biết mực nước trong hồ là bao nhiêu.', 4, 1)
insert into lst_study_topic_vocab values(6, 'radius', N'/ˈreɪdiəs/', 'noun', N'bán kính', N'', N'', 4, 1)
insert into lst_study_topic_vocab values(7, 'volume', N'/ˈvɒljuːm/', 'noun', N'số lượng, khối lượng, âm thanh', N'Could you turn the volume down? I''m trying to study.', N'Cậu có thể vặn nhỏ âm lượng lại được không? Tớ đang cố gắng để học.', 4, 1)
insert into lst_study_topic_vocab values(8, 'width', N'/wɪdθ/', 'noun', N'bề rộng, bề ngang', N'They tried to measure the width of the room with their feet.', N'Họ đã cố gắng đo chiều rộng của căn phòng bằng bàn chân.', 4, 1)
insert into lst_study_topic_vocab values(9, 'adjust', N'/əˈdʒʌst/', 'verb', N'điều chỉnh, làm cho thích hợp', N'I''ve made a few adjustments to the design.', N'Tôi đã thực hiện một vài điều chỉnh để thiết kế.', 4, 1)
insert into lst_study_topic_vocab values(10, 'decrease', N'/dɪˈkriːs/', 'verb', N'sự giảm đi, giảm đi', N'Infation causes the value of money to decrease.', N'Lạm phát làm cho giá trị của đồng tiền bị giảm sút.', 4, 1)
insert into lst_study_topic_vocab values(11, 'extend', N'/ɪkˈstend/', 'verb', N'kéo dài (thời hạn..); gia hạn, mở rộng', N'I would like to extend my membership.', N'Tôi muốn gia hạn thẻ thành viên của mình.', 4, 1)
insert into lst_study_topic_vocab values(12, 'convey', N'/kənˈveɪ/', 'verb', N'chuyển tải, thể hiện (ý tưởng, cảm xúc đến ai)', N'', N'', 4, 1)
insert into lst_study_topic_vocab values(13, 'reinforce', N'/ˌriːɪnˈfɔːs/', 'verb', N'tăng cường, củng cố, gia cố', N'Employees reinforced their learning with practice in thư workplace.', N'Các nhân viên củng cố kiến thức của mình bằng thực hành tại nơi làm việc.', 4, 1)
insert into lst_study_topic_vocab values(14, 'mutually', N'/ˈmjuːtʃuəli/', 'adverb', N'lẫn nhau, qua lại', N'', N'', 4, 1)
insert into lst_study_topic_vocab values(15, 'secure', N'/sɪˈkjʊə/', 'verb', N'an toàn, an ninh; bảo đảm', N'The hostess secured us another chair, so we could eat together.', N'Bà chủ bữa tiệc đã tìm được cho chúng tôi chiếc ghế khác, vì vậy chúng tôi có thể ăn cùng nhau.', 4, 1)
insert into lst_study_topic_vocab values(16, 'suspend', N'/səˈspend/', 'verb', N'treo, treo lên', N'We regret to inform you that your account has been suspended.', N'Chúng tôi rất tiếc phải thông báo với bạn rằng tài khoản của bạn đã treo.', 4, 1)
insert into lst_study_topic_vocab values(17, 'notion', N'/ˈnəʊ.ʃən/', 'noun', N'ý niệm, khái niệm', N'', N'', 4, 1)
insert into lst_study_topic_vocab values(18, 'victory', N'/ˈvɪktəri/', 'noun', N'chiến thắng, sự chiến thắng', N'Real Madrid gets a narrow victory at Rayo Vallencano on November 2nd.', N'Real Madrid đã giành chiến thắng sát sao trước Rayo Vallencano vào hôm mùng 2 tháng 11.', 4, 1)
insert into lst_study_topic_vocab values(19, 'peace', N'/piːs/', 'noun', N'sự hòa bình, sự/thời kỳ hòa bình', N'After continuous conflict for many years, the two contries finally live side by side in peace.', N'Sau nhiều năm xung đột liên tục, hai quốc gia cuối cùng đã chung sống hòa bình với nhau.', 4, 1)
insert into lst_study_topic_vocab values(20, 'belief', N'/bɪˈliːf/', 'noun', N'lòng tin, sự tin tưởng', N'The incident has shaken my belief in the police.', N'Vụ án đó đã làm mất lòng tin của tôi vào cảnh sát.', 4, 1)

insert into lst_study_topic_vocab values(1, 'commuter', N'/kəˈmjuːtər/', 'noun', N'Người đi làm xa mỗi ngày, người đi làm bằng vé tháng', N'', N'', 5, 1)
insert into lst_study_topic_vocab values(2, 'congestion', N'/kənˈdʒestʃən/', 'noun', N'sự ùn tắc, sự tắc nghẽn (đường sá...)', N'There was congestion on this street from the strike by bus drivers.', N'Đã xảy ra tắc đường trên con đường vì các tài xế xe buýt đình công.', 5, 1)
insert into lst_study_topic_vocab values(3, 'traffic', N'/ˈtræfɪk/', 'noun', N'Sự đi lại, giao thông, vận tải', N'You should go before rush hour, or you''ll be stuck in traffic jams!', N'Bạn nên đi trước giờ cao điểm, nếu không sẽ bị tắc đường đấy!', 5, 1)
insert into lst_study_topic_vocab values(4, 'cause', N'/kɔːz/', 'noun', N'sinh ra, gây ra, gây nên', N'Having too much free time, can surprisingly be a cause of stress.', N'Có quá nhiều thời gian rảnh rỗi thật đáng ngạc nhiên lại là một nguyên nhân của sự căng thẳng.', 5, 1)
insert into lst_study_topic_vocab values(5, 'reduce', N'/rɪˈdjuːs/', 'verb', N'giảm, hạ', N'The goverment should take action to reduce the unemployment rate.', N'Chính phủ nên hành động để giảm tỷ lệ thất nghiệp.', 5, 1)
insert into lst_study_topic_vocab values(6, 'resident', N'/ˈrezɪdənt/', 'noun', N'cư dân, người dân', N'The residents in the village want to protect the local precious plants.', N'Người dân trong làng muốn bảo vệ các loài thực vật quý của địa phương.', 5, 1)
insert into lst_study_topic_vocab values(7, 'evacuate', N'/ɪˈvækjueɪt/', 'verb', N'di tản, sơ tán', N'', N'', 5, 1)
insert into lst_study_topic_vocab values(8, 'report', N'/rɪˈpɔːt/', 'noun', N'bản tường thuật, phóng sự', N'You have one day to finish your report.', N'Bạn có một ngày để hoàn thành báo cáo của mình.', 5, 1)
insert into lst_study_topic_vocab values(9, 'deport', N'/dɪˈpɔːt/', 'noun', N'trục xuất', N'', N'', 5, 1)
insert into lst_study_topic_vocab values(10, 'illegal', N'/ɪˈliːɡl/', 'adjective', N'bất hợp pháp, trái pháp luật', N'It''s illegal to force a child to work.', N'Ép một đứa trẻ làm việc là vi phạm pháp luật.', 5, 1)
insert into lst_study_topic_vocab values(11, 'skilled', N'/skɪld/', 'adjective', N'lành nghề, có tay nghề cao, kinh nghiệm', N'He is a skilled carpenter.', N'
Anh ấy là một thợ mộc lành nghề.', 5, 1)
insert into lst_study_topic_vocab values(12, 'visa', N'/ˈviːzə/', 'noun', N'thị thực, vi sa', N'We accept payment by Visa Electro, Visa, Switch, Maestro, Mastercard. JCB, Solo, check or cash.', N'Chúng tôi chấp nhận thanh toán bằng thẻ Visa Electro, Visa, Switch, Maestro, Mastercard. JCB, Solo, séc hoặc tiền mặt.', 5, 1)
insert into lst_study_topic_vocab values(13, 'infrastructure', N'/ˈɪnfrəstrʌktʃər/', 'noun', N'cơ sở hạ tầng', N'A civil engineering degree prepares you to work in various engineering areas, from construction to communications infrastructure.', N'Một bằng kỹ sư dân sự trang bị cho bạn làm việc trong các lĩnh vực kỹ thuật khác nhau, từ xây dựng đến cơ sở hạ tầng truyền thông.', 5, 1)
insert into lst_study_topic_vocab values(14, 'transport', N'/ˈtrænspɔːt/', 'noun', N'chuyên chở, vận chuyển', N'What means of transport will you use to go to Paris?', N'Bạn sẽ sử dụng phương tiện giao thông nào để đến Pari?', 5, 1)
insert into lst_study_topic_vocab values(15, 'rail', N'/reɪl/', 'noun', N'tay vịn, lan can, chấn song', N'The train was going so fast that it almost flew off the rails.', N'
Con tàu đang chạy quá nhanh đến nỗi nó gần như bay khỏi đường ray.', 5, 1)
insert into lst_study_topic_vocab values(16, 'neighbourhood', N'/ˈneɪbəhʊd/', 'noun', N'khu vực lân cận; hàng xóm', N'He shouted so loudly that the whole neighbourhood could hear him.', N'Anh ta hét to đến nỗi cả khu phố đều có thể nghe thấy anh ta.', 5, 1)
insert into lst_study_topic_vocab values(17, 'pioneering', N'/ˌpaɪəˈnɪərɪŋ/', 'adjective', N'đi tiên phong, đi đầu', N'', N'', 5, 1)
insert into lst_study_topic_vocab values(18, 'historic', N'/hɪˈstɒrɪk/', 'adjective', N'có tính chất lịch sử; được ghi vào lịch sử', N'To deal with this old case we must place it in its historical context.', N'Để giải quyết trường hợp cũ này, chúng ta phải đặt nó trong bối cảnh lịch sử của nó.', 5, 1)
insert into lst_study_topic_vocab values(19, 'warfare', N'/ˈwɔːfeə/', 'adjective', N'cuộc xung đột, cuộc đấu tranh', N'', N'', 5, 1)
insert into lst_study_topic_vocab values(20, 'rooftop', N'/ˈruːftɒp/', 'noun', N'nóc nhà', N'', N'', 5, 1)

--Study Topic 2

insert into lst_study_topic_vocab values(1, 'abide by', N'/ə''baid/', 'verb', N'Tuân theo, chịu theo', N'The two parties agreed to abide by the judge''s decision.', N'Hai bên đã đồng ý tuân theo quyết định của tòa án.', 1, 2)
insert into lst_study_topic_vocab values(2, 'agreement', N'/əˈɡriːmənt/', 'noun', N'hợp đồng, giao kèo, sự đồng ý/ thỏa thuận với nhau', N'According to the agreement, the caterer will also supply the flowers for the event.', N'Theo thỏa thuận, nhà cung cấp thực phẩm cũng sẽ cung cấp hoa cho sự kiện.', 1, 2)
insert into lst_study_topic_vocab values(3, 'assurance', N'/əˈʃʊərəns/', 'noun', N'sự cam đoan, bảo đảm, chắc chắn; sự tin chắc, tự tin', N'The sales associate gave his assurance that the missing keyboard would be replaced the next day.', N'Nhân viên bán hàng đảm bảo rằng bàn phím lỗi sẽ được thay thế vào ngày hôm sau.', 1, 2)
insert into lst_study_topic_vocab values(4, 'cancellation', N'/ˌkænsəˈleɪʃn/', 'noun', N'sự bãi bỏ, hủy bỏ', N'The cancellation of her flight caused her problems for the rest of the week.', N'Việc chuyến bay của cô ấy bị hủy đã khiến cô ấy gặp rắc rối trong suốt thời gian còn lại của tuần.', 1, 2)
insert into lst_study_topic_vocab values(5, 'determine', N'/dɪˈtɜːmɪn/', 'verb', N'xác định, quyết định', N'After reading the contract, I was still unable to determine if our company was liable for back wages.', N'Sau khi đọc hợp đồng, tôi vẫn không thể xác định được liệu chúng tôi có công ty phải chịu trách nhiệm trả lại tiền lương.', 1, 2)
insert into lst_study_topic_vocab values(6, 'engage', N'/ɪnˈɡeɪdʒ/', 'verb', N'(v)Tham gia, cam kết, (n)sự hứa hẹn, hứa hôn', N'He really wants to engage his classmates, but he doesn''t know how to do that.', N'Anh ấy thực sự muốn thu hút các bạn cùng lớp của mình, nhưng anh ấy không biết làm thế nào để làm điều đó.', 1, 2)
insert into lst_study_topic_vocab values(7, 'establish', N'/ɪˈstæblɪʃ/', 'verb', N'thiết lập, thành lập; xác minh, chứng minh, củng cố', N'This company was established in 2010.', N'Công ty này được thành lập vào năm 2010.', 1, 2)
insert into lst_study_topic_vocab values(8, 'obligate', N'/ˈɒblɪɡeɪt/', 'verb', N'bắt buộc, ép buộc', N'The contractor was obligated by the contract to work 40 hours a week.', N'Nhà thầu buộc phải làm vi͏ệc 40 tiếng mỗi tuần.', 1, 2)
insert into lst_study_topic_vocab values(9, 'party', N'/ˈpɑːti/', 'noun', N'đảng, phái, nhóm', N'The parties agreed to settlement in their contract dispute.', N'Các bên đã đồng ý giải quyết trong tranh chấp hợp đồng của họ.', 1, 2)
insert into lst_study_topic_vocab values(10, 'provision', N'/prəˈvɪʒn/', 'noun', N'dự phòng, điều khoản', N'The father made provision for his children through his will.', N'Người cha đã cung cấp cho con cái của mình thông qua di chúc của mình.', 1, 2)
insert into lst_study_topic_vocab values(11, 'resolve', N'/rɪˈzɒlv/', 'verb', N'giải quyết', N'The manager resolved to clean out all the files at the end of the week.', N'Người quản lý đã quyết định dọn sạch tất cả các tệp ở cuối tuần.', 1, 2)
insert into lst_study_topic_vocab values(12, 'specific', N'/spəˈsɪfɪk/', 'adjective', N'cụ thể, rõ ràng, rành mạch', N'The customer''s specific complaint was not addressed in his e-mail.', N'Khiếu nại cụ thể của khách hàng không được giải quyết trong e-mail của anh ấy.', 1, 2)

insert into lst_study_topic_vocab values(1, 'attract', N'/əˈtrækt/', 'verb', N'hấp dẫn, lôi cuốn, thu hút', N'The display attracted a number of people at the convention.', N'Việc trưng bày đã thu hút một số người tại hội nghị.', 2, 2)
insert into lst_study_topic_vocab values(2, 'compare', N'/kəmˈpeə/', 'verb', N'so sánh', N'Some parents want to compare their children with others.', N'Nhiều bậc cha mẹ muốn so sánh con cái của họ với con của những người khác.', 2, 2)
insert into lst_study_topic_vocab values(3, 'competition', N'/ˌkɒmpəˈtɪʃn/', 'noun', N'cuộc thi', N'Who do you think will win that cooking competition?', N'Bạn nghĩ ai sẽ thắng cuộc thi nấu ăn đó?', 2, 2)
insert into lst_study_topic_vocab values(4, 'consume', N'/kənˈsjuːm/', 'verb', N'tiêu thụ, tiêu dùng', N'People consume a good deal of sugar in drinks.', N'Mọi người tiêu dùng một lượng đường lớn trong đồ uống.', 2, 2)
insert into lst_study_topic_vocab values(5, 'convince', N'/kənˈvɪns/', 'verb', N'Thuyết phục', N'He convinced me that he was right.', N'Anh ấy đã thuyết phục tôi rằng anh ấy đúng.', 2, 2)
insert into lst_study_topic_vocab values(6, 'currently', N'/ˈkʌrəntli/', 'adverb', N'hi͏ện tại, lúc này', N'Currently, customers are demanding big discounts for bulk orders.', N'Hiện tại, khách hàng đang yêu cầu giảm giá lớn cho các đơn đặt hàng số lượng lớn.', 2, 2)
insert into lst_study_topic_vocab values(7, 'fad', N'/fæd/', 'noun', N'mốt nhất thời', N'The mini dress was a fad once thought to be finished, but now it is making a comeback.', N'Váy ngắn từng là mốt tạm thời mỗi khi ý tưởng bị hết, nhưng hiện giờ nó đang quay trở lại.', 2, 2)
insert into lst_study_topic_vocab values(8, 'inspiration', N'/ˌɪnspəˈreɪʃn/', 'noun', N'cảm hứng', N'Nature is a source of inspiration for inventors.', N'Thiên nhiên là nguồn cảm hứng cho các nhà phát minh.', 2, 2)
insert into lst_study_topic_vocab values(9, 'market', N'/ˈmɑːkɪt/', 'noun', N'thị trường, chợ, nơi mua bán sản phẩm...', N'My mother goes to the market every morning.', N'Mẹ tôi đi chợ mỗi sáng.', 2, 2)
insert into lst_study_topic_vocab values(10, 'persuasion', N'/pəˈsweɪʒn/', 'noun', N'sự thuyết phục, làm cho tin', N'The seminar teaches techniques of persuasion to increase sales.', N'Hội thảo dạy các kỹ thuật thuyết phục để gia tăng doanh số.', 2, 2)
insert into lst_study_topic_vocab values(11, 'productive', N'/prəˈdʌktɪv/', 'adjective', N'có năng suất, hi͏ệu quả', N'The managers had a very productive meeting and were able to solve many of the problems.', N'Các nhà quản lý đã có một cuộc họp rất hiệu quả và đã có thể giải quyết nhiều vấn đề.', 2, 2)
insert into lst_study_topic_vocab values(12, 'satisfaction', N'/ˌsætɪsˈfækʃn/', 'noun', N'sự hài lòng, sự thỏa mãn,', N'Your satisfaction is guaranteed or you''ll get your money back.', N'
Sự hài lòng của bạn được đảm bảo, hoặc là bạn sẽ nhận lại được tiền của mình.', 2, 2)

insert into lst_study_topic_vocab values(1, 'characteristic', N'/ˌkærəktəˈrɪstɪk/', 'noun', N'đặc trưng, đặc điểm, đặc thù, cá bi͏ệt', N'One characteristic of the store is that it is slow in mailing refund checks.', N'Một đặc điểm của cửa hàng là gửi séc hoàn tiền chậm.', 3, 2)
insert into lst_study_topic_vocab values(2, 'consequence', N'/ˈkɒnsɪkwəns/', 'noun', N': kết quả, hậu quả, h͏ệ quả; tầm quan trọng, tính trọng đại', N'As a consequence of not having seen a dentist for several years, Lydia had several cavities.', N'Hậu quả của việc không gặp nha sĩ trong nhiều năm, Lydia có vài lỗ sâu răng.', 3, 2)
insert into lst_study_topic_vocab values(3, 'consider', N'/kənˈsɪdər/', 'verb', N'xem như', N'You shouldn''t consider marrying a man for his money.', N'Bạn không nên cân nhắc kết hôn với một người đàn ông vì tiền của anh ta.', 3, 2)
insert into lst_study_topic_vocab values(4, 'cover', N'/ˈkʌvər/', 'verb', N'che, phủ, trùm, bọc; bao gồm', N'The passport is covered with leather.', N'Hộ chiếu được bọc bằng da.', 3, 2)
insert into lst_study_topic_vocab values(5, 'expiration', N'/ˌekspəˈreɪʃn/', 'noun', N'sự mãn hạn, sự hết hạn, sự kết thúc', N'Have you checked the expiration date on this yogurt?', N'Bạn đã kiểm tra ngày hết hạn trên sữa chua này chưa?', 3, 2)
insert into lst_study_topic_vocab values(6, 'frequently', N'/ˈfriːkwəntli/', 'adverb', N'thường xuyên, một cách thường xuyên', N'Appliances frequently come with a one-year warranty.', N'Các thiết bị gia dụng thường có bảo hành một năm.', 3, 2)
insert into lst_study_topic_vocab values(7, 'imply', N'/ɪmˈplaɪ/', 'verb', N'ngụ ý, hàm ý, ẩn ý, ý nói', N'The guarantees on the Walkman imply that all damages were covered under warranty for one year.', N'Giấy bảo đảm theo máy nghe nhạc Walkman đã ngụ ý rằng mọi hư hỏng đều được bao gồm trong thời hạn bảo hành là 1 năm.', 3, 2)
insert into lst_study_topic_vocab values(8, 'promise', N'/ˈprɒmɪs/', 'verb', N'hứa hẹn', N'Please promise not to tell anyone!', N'Xin hãy hứa là không nói với ai!', 3, 2)
insert into lst_study_topic_vocab values(9, 'protect', N'/prəˈtekt/', 'verb', N'bảo v͏ệ, bảo hộ, che chở', N'Consumer laws are designed to protect the public against unscrupulous vendors.', N'Luật tiêu dùng được thiết kế để bảo vệ công chúng chống lại các nhà cung cấp vô đạo đức.', 3, 2)
insert into lst_study_topic_vocab values(10, 'reputation', N'/ˌrepjuˈteɪʃn/', 'noun', N'danh tiếng, thanh danh, tiếng (tốt của nhân vật)', N'Hogwarts is a school with an excellent reputation.', N'
Hogwarts là một ngôi trường có danh tiếng xuất sắc.', 3, 2)
insert into lst_study_topic_vocab values(11, 'require', N'/rɪˈkwaɪə/', 'verb', N'đòi hỏi, yêu cầu', N'The law requires that each item clearly display the warranty information.', N'Luật yêu cầu mỗi mặt hàng phải hiển thị rõ ràng thông tin bảo hành.', 3, 2)
insert into lst_study_topic_vocab values(12, 'variety', N'/vəˈraɪəti/', 'noun', N'sự đa dạng, trạng thái muôn màu', N'Thanks to the development of the media, people have more chances to see a variety of programs.', N'Nhờ sự phát triển của các phương tiện truyền thông, mọi người có nhiều cơ hội hơn để xem nhiều chương trình khác nhau.', 3, 2)

insert into lst_study_topic_vocab values(1, 'address', N'/əˈdres/', 'verb', N'nhằm vào, trình bày', N'Marco''s business plan addresses the needs of small business owners.', N'Kế hoạch kinh doanh của Marco nhằm vào nhu cầu của những chủ doanh nghiệp nhỏ.', 4, 2)
insert into lst_study_topic_vocab values(2, 'avoid', N'/əˈvɔɪd/', 'verb', N'tránh, tránh khỏi; hủy bỏ, bác bỏ', N'To avoid going out of business, owners should prepare a proper business plan.', N'Để tránh phá sản, chủ sở hữu nên chuẩn bị một kế hoạch kinh doanh phù hợp.', 4, 2)
insert into lst_study_topic_vocab values(3, 'demonstrate', N'/ˈdemənstreɪt/', 'verb', N'bày tỏ, biểu lộ, cho thấy; chứng minh, giải thích', N'Let me demonstrate to you some of the difficulties we are facing.', N'Hãy để tôi trình bày cho bạn thấy một số khó khăn mà chúng tôi đang phải đối mặt.', 4, 2)
insert into lst_study_topic_vocab values(4, 'develop', N'/dɪˈveləp/', 'verb', N'phát triển', N'This job can give you an opportunity to develop new skills.', N'Công việc này có thể cho bạn cơ hội phát triển những kỹ năng mới.', 4, 2)
insert into lst_study_topic_vocab values(5, 'evaluate', N'/ɪˈvæljueɪt/', 'verb', N'đánh giá, định giá; ước lượng', N'It''s important to evaluate your competition when making a business plan.', N'Điều quan trọng là phải đánh giá sự cạnh tranh của bạn khi lập kế hoạch kinh doanh.', 4, 2)
insert into lst_study_topic_vocab values(6, 'gather', N'/ˈɡæðər/', 'verb', N'tập hợp, tụ tập, thu thập; kết luận, suy ra', N'We gathered information for our plan from many sources.', N'Chúng tôi thu thập thông tin cho kế hoạch của chúng tôi từ nhiều nguồn.', 4, 2)
insert into lst_study_topic_vocab values(7, 'offer', N'/ˈɔːfər/', 'verb', N'đề xuất, đề nghị, chào mời, chào hàng', N'Devon accepted our offer to write the business plan.', N'Devon đã chấp nhận lời đề nghị của chúng tôi để viết một bản kế hoạch kinh doanh.', 4, 2)
insert into lst_study_topic_vocab values(8, 'primarily', N'/praɪˈmerəli/', 'adverb', N': trước hết, đầu tiên; chính, chủ yếu, quan trọng nhất', N'The developers are thinking primarily of how to enter the South American market.', N'Các nhà phát triển quan tâm nhất đến việc làm sao để xâm nhập thị trường Nam Mỹ.', 4, 2)
insert into lst_study_topic_vocab values(9, 'risk', N'/rɪsk/', 'noun', N'nguy cơ, sự nguy hiểm, sự rủi ro', N'The primary risk for most start-up businesses is insufficient capital.', N'Nguy cơ lớn nhất đối với hầu hết các doanh nghiệp mới thành lập là không đủ vốn.', 4, 2)
insert into lst_study_topic_vocab values(10, 'strategy', N'/ˈstrætədʒi/', 'noun', N'chiến lược, sự vạch kế hoạch hành động', N'A business plan is a strategy for running a business and avoiding problems.', N'Một kế hoạch kinh doanh là một chiến lược để điều hành một doanh nghiệp và tránh các vấn đề.', 4, 2)
insert into lst_study_topic_vocab values(11, 'strong', N'/strɒŋ/', 'adjective', N'khỏe, mạnh, tốt, bền, kiên cố; đanh thép, kiên quyết; sôi nổi, nhi͏ệt tình...', N'That boy is very strong.', N'Cậu bé đó rất mạnh mẽ.', 4, 2)
insert into lst_study_topic_vocab values(12, 'substitution', N'/ˌsʌbstɪˈtjuːʃn/', 'noun', N'sự đổi, sự thay thế', N'Your substitution of fake names for real ones makes the document seem insincere.', N'Việc bạn thay thế tên giả bằng tên thật làm cho tài liệu có vẻ không trung thực.', 4, 2)

insert into lst_study_topic_vocab values(1, 'accommodate', N'/əˈkɒmədeɪt/', 'verb', N'làm cho phù hợp', N'The meeting room was large enough to accommodate the various needs of the groups using it.', N'Phòng họp đủ lớn để phù hợp với các nhu cầu khác nhau của các nhóm sử dụng nó.', 5, 2)
insert into lst_study_topic_vocab values(2, 'arrangement', N'/əˈreɪndʒmənt/', 'noun', N'sự sắp xếp', N'The travel arrangements were taken care of by Sara, Mr. Billing''s capable assistant.', N'Việc thu xếp chuyến đi được chịu trách nhiệm bởi Sara, trợ lý đắc lực của ông Billing.', 5, 2)
insert into lst_study_topic_vocab values(3, 'association', N'/əˌsəʊsiˈeɪʃn/', 'noun', N'hội, hiệp hội, tổ chức', N'I know that ASEAN stands for the Association of Southeast Asian Nations.', N'Tôi biết rằng ASEAN là viết tắt của Hiệp hội các quốc gia Đông Nam Á.', 5, 2)
insert into lst_study_topic_vocab values(4, 'attend', N'/əˈtend/', 'verb', N'tham dự, có mặt', N'We expect more than 100 members to attend the annual meeting.', N'Chúng tôi mong đợi hơn 100 thành viên đến tham dự cuộc họp thường niên.', 5, 2)
insert into lst_study_topic_vocab values(5, 'get in touch', N'/ɡet ɪn tʌtʃ/', 'verb', N'liên lạc với', N'As soon as we arrive at the hotel, we will get in touch with the manager about the unexpected guests.', N'Ngay khi đến khách sạn, chúng tôi sẽ liên hệ với người quản lý về những vị khách không mời.', 5, 2) 
insert into lst_study_topic_vocab values(6, 'hold', N'/həʊld/', 'verb', N'chứa, đựng, tổ chức', N'This meeting room holds at least 80 people comfortably.', N'Phòng họp này chứa được thoải mái ít nhất 80 người.', 5, 2)
insert into lst_study_topic_vocab values(7, 'location', N'/ləʊˈkeɪʃn/', 'noun', N'vị trí', N'The location of the meeting was changed from the Red Room to the Green Room.', N'Địa điểm của cuộc họp đã được thay đổi từ Phòng Đỏ sang Phòng Xanh.', 5, 2)
insert into lst_study_topic_vocab values(8, 'overcrowded', N'/ˌəʊvəˈkraʊdɪd/', 'adjective', N'chật ních, đông nghịt', N'Too many poor people are living in overcrowded conditions.', N'Quá nhiều người nghèo đang sống trong điều kiện chật chội.', 5, 2)
insert into lst_study_topic_vocab values(9, 'register', N'/ˈredʒɪstər/', 'verb', N'đăng ký', N'You can register this mail for an additional $2.2.', N'Bạn có thể đăng ký thư này để có thêm $2,2.', 5, 2)
insert into lst_study_topic_vocab values(10, 'select', N'/sɪˈlekt/', 'verb', N'chọn lựa, chọn lọc', N'They were selected to match her clothes.', N'Chúng đã được chọn để hợp với quần áo của cô ấy.', 5, 2)
insert into lst_study_topic_vocab values(11, 'session', N'/ˈseʃn/', 'noun', N'kỳ họp, buổi họp', N'The morning sessions tend to fill up first, so sign up early.', N'Các phiên buổi sáng có xu hướng kín chỗ trước, vì vậy hãy đăng ký sớm.', 5, 2)
insert into lst_study_topic_vocab values(12, 'take part in', N'/teɪk pɑːt ɪn/', 'verb', N'tham dự, tham gia', N'We could not get enough people to take part in the meeting, so we canceled it.', N'
Chúng tôi không thể có đủ người tham gia cuộc họp, vì vậy chúng tôi đã hủy bỏ nó.', 5, 2)

--Study Topic 3

insert into lst_study_topic_vocab values(1, 'abandon', N'/əˈbændən/', 'verb', N'bỏ rơi, ruồng bỏ', N'We were unable to get funding and therefore had to abandon the project.', N'
Chúng tôi không thể nhận được tài trợ và do đó phải từ bỏ dự án.', 1, 3)
insert into lst_study_topic_vocab values(2, 'boost', N'/buːst/', 'verb', N'nâng lên, đẩy mạnh', N'The new policy has boosted the workers productivity.', N'Chính sách mới đã thúc đẩy năng suất của công nhân.', 1, 3)
insert into lst_study_topic_vocab values(3, 'sustainable', N'/səˈsteɪnəbl/', 'adjective', N'bền vững', N'', N'', 1, 3)
insert into lst_study_topic_vocab values(4, 'fertilization', N'/ˌfɜːtəlaɪˈzeɪʃn/', 'noun', N'việc chăm bón', N'', N'', 1, 3)
insert into lst_study_topic_vocab values(5, 'irrigation', N'/ˌɪrɪˈɡeɪʃn/', 'noun', N'sự tưới tiêu', N'', N'', 1, 3) 
insert into lst_study_topic_vocab values(6, 'obtain', N'/əbˈteɪn/', 'verb', N'đạt được, thu được, giành được, kiếm được (to acquire)', N'The finally obtained what they wanted and left.', N'
Họ cuối cùng cũng đạt được những gì mình muốn và rời đi.', 1, 3)
insert into lst_study_topic_vocab values(7, 'photosynthesis', N'/ˌfəʊtəʊˈsɪnθəsɪs/', 'noun', N'(sinh vật học) sự quang hợp', N'', N'', 1, 3)
insert into lst_study_topic_vocab values(8, 'rainfall', N'/ˈreɪnfɔːl/', 'noun', N'lượng mưa', N'The average annual rainfall in the region is 500 mm.', N'Lượng mưa trung bình hàng năm trong khu vực là 500 mm.', 1, 3)
insert into lst_study_topic_vocab values(9, 'production', N'/prəˈdʌkʃn/', 'noun', N'sự sản xuất, (sự) sản xuất', N'The production of milk reduces when the cows are badly cared for.', N'
Việc sản xuất sữa giảm khi những con bò được chăm sóc không tốt.', 1, 3)
insert into lst_study_topic_vocab values(10, 'demand', N'/dɪˈmɑːnd/', 'noun', N'đòi hỏi, yêu cầu; cần phải', N'They increase production to meet the customers'' demand.', N'Họ gia tăng sản xuất để đáp ứng nhu cầu của khách hàng.', 1, 3)
insert into lst_study_topic_vocab values(11, 'productivity', N'/ˌprɒdʌkˈtɪvəti/', 'noun', N'Hiệu suất, năng suất', N'A rapid growth in productivity shows a good sign of improving technology.', N'Sự tăng trưởng nhanh chóng trong năng suất cho thấy một dấu hiệu tốt về cải tiến công nghệ.', 1, 3)
insert into lst_study_topic_vocab values(12, 'seed', N'/siːd/', 'noun', N'hạt, hạt giống', N'The strongest and most productive plants are kept for seed.', N'Những cây khỏe nhất và năng suất cao nhất được giữ lại để làm hạt giống.', 1, 3)
insert into lst_study_topic_vocab values(13, 'soil', N'/sɔɪl/', 'noun', N'đất, đất trồng', N'The soil is too poor for us to grow any plants.', N'Đất này quá cằn cỗi để chúng ta có thể trồng bất kỳ loại cây nào.', 1, 3)
insert into lst_study_topic_vocab values(14, 'revitalization', N'/ˌriːˌvaɪtəlaɪˈzeɪʃn/', 'noun', N'sự tái sinh', N'', N'', 1, 3)
insert into lst_study_topic_vocab values(15, 'incompetence', N'/ɪnˈkɒmpɪtəns/', 'noun', N'sự thiếu trình độ, năng lực', N'', N'', 1, 3) 
insert into lst_study_topic_vocab values(16, 'specialist', N'/ˈspeʃəlɪst/', 'noun', N'chuyên gia, chuyên viên', N'He''s a computer specialist.', N'Anh ấy là một chuyên gia máy tính.', 1, 3)
insert into lst_study_topic_vocab values(17, 'hurdle', N'/ˈhɜːdl/', 'noun', N'chạy vượt rào, rào cản', N'He took part in the 400-metre hurdles.', N'Anh ấy đã tham gia chạy vượt rào 400 mét.', 1, 3)
insert into lst_study_topic_vocab values(18, 'technique', N'/tekˈniːk/', 'noun', N'kĩ thuật, phương pháp', N'You should combine different techniques in your teaching.', N'Bạn nên kết hợp các thủ thuật khác nhau trong bài giảng của mình.', 1, 3)
insert into lst_study_topic_vocab values(19, 'method', N'/ˈmeθəd/', 'noun', N'phương pháp, cách thức', N'What kind of research methods did you use in your study?', N'Những loại phương pháp nghiên cứu bạn đã sử dụng trong nghiên cứu của mình?', 1, 3)
insert into lst_study_topic_vocab values(20, 'cooperation', N'/kəʊˌɒpəˈreɪʃn/', 'noun', N'sự hợp tác', N'We would like to see closer cooperation between parents and schools.', N'Chúng tôi mong muốn thấy sự hợp tác chặt chẽ hơn giữa phụ huynh và nhà trường.', 1, 3)

insert into lst_study_topic_vocab values(1, 'anticipate', N'/ænˈtɪsɪpeɪt/', 'verb', N'Dự đoán; Lường trước', N'The total cost of our holiday was less than we anticipated.', N'Tổng chi phí cho kỳ nghỉ của chúng tôi ít hơn chúng tôi dự đoán.', 2, 3)
insert into lst_study_topic_vocab values(2, 'catastrophic', N'/ˌkætəˈstrɒfɪk/', 'adjective', N'thảm khốc, thê thảm', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(3, 'collide', N'/kəˈlaɪd/', 'verb', N'va nhau, đụng nhau', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(4, 'eruption', N'/ɪˈrʌpʃn/', 'noun', N'sự phun trào, sự bùng nổ', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(5, 'famine', N'/ˈfæmɪn/', 'noun', N'nạn đói, nạn đói kém', N'Vietnam strongly faced famine and poverty in 1945.', N'Việt Nam đã phải đối mặt nặng nề với nạn đói và nghèo vào năm 1945.', 2, 3) 
insert into lst_study_topic_vocab values(6, 'flood', N'/flʌd/', 'noun', N'lũ lụt, nạn lụt', N'There was a big flood after the levees broke.', N'Có một trận lụt lớn sau khi những con đê bị vỡ.', 2, 3)
insert into lst_study_topic_vocab values(7, 'impact', N'/ˈɪmpækt/', 'noun', N'(sự/sức) va chạm, va chạm mạnh, tác động mạnh, ảnh hưởng mạnh', N'The study indicated that eating habits had great impacts on the health.', N'
Nghiên cứu chỉ ra rằng thói quen ăn uống có ảnh hưởng lớn đến sức khỏe.', 2, 3)
insert into lst_study_topic_vocab values(8, 'persevere', N'/ˌpɜːsəˈvɪə/', 'verb', N'kiên nhẫn, kiên trì', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(9, 'plunge', N'/plʌndʒ/', 'verb', N'lao vào, ập vào', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(10, 'unleash', N'/ʌnˈliːʃ/', 'verb', N'giải phóng, tỏa ra', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(11, 'coast', N'/kəʊst/', 'noun', N'bờ (biển, đại dương)', N'I''d like to take a boat trip along the coast.', N'Tôi muốn thực hiện một chuyến đi bằng thuyền dọc theo bờ biển.', 2, 3)
insert into lst_study_topic_vocab values(12, 'phenomenon', N'/fəˈnɒmɪnən/', 'noun', N'hiện tượng', N'Mist is a phenomenon where a light cloud floats just above the ground and makes it difficult for you to see.', N'Sương mù là hiện tượng một đám mây mỏng lơ lửng ngay trên mặt đất và khiến bạn khó nhìn thấy.', 2, 3)
insert into lst_study_topic_vocab values(13, 'destruction', N'/dɪˈstrʌkʃn/', 'noun', N'sự tàn phá, sự phá hủy', N'He was charged with using weapons of mass destruction.', N'Anh ta bị buộc tội sử dụng vũ khí hủy diệt hàng loạt.', 2, 3)
insert into lst_study_topic_vocab values(14, 'tsunami', N'/tsuːˈnɑːmi/', 'noun', N'sóng thần', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(15, 'explosion', N'/ɪkˈspləʊʒn/', 'noun', N'sự bùng nổ, vụ nổ', N'A big gas explosion killed dozens of people in the town.', N'Một vụ nổ ga lớn đã giết chết hàng chục người trong thị trấn.', 2, 3) 
insert into lst_study_topic_vocab values(16, 'landslide', N'/ˈlændslaɪd/', 'noun', N'sự lở đất, sạt lở đất', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(17, 'volcanic', N'/vɒlˈkænɪk/', 'adjective', N'(thuộc) núi lửa', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(18, 'meteorite', N'/ˈmiːtiəraɪt/', 'noun', N'thiên thạch', N'Martian meteorite yields more evidence of the possibility of life on Mars.', N'Thiên thạch sao Hỏa mang lại nhiều bằng chứng về khả năng tồn tại sự sống trên sao Hỏa', 2, 3)
insert into lst_study_topic_vocab values(19, 'erosion', N'/ɪˈrəʊʒn/', 'noun', N'sự xói mòn', N'', N'', 2, 3)
insert into lst_study_topic_vocab values(20, 'meteorology', N'/ˌmiːtiəˈrɒlədʒi/', 'noun', N'khí tượng học', N'', N'', 2, 3)

insert into lst_study_topic_vocab values(1, 'adapt', N'/əˈdæpt/', 'verb', N'thay đổi để thích ứng/thích nghi, điều chỉnh', N'Some people are not good at learning how to adapt to living in a new country.', N'Một số người không giỏi trong việc học cách thích nghi với cuộc sống ở một đất nước mới.', 3, 3)
insert into lst_study_topic_vocab values(2, 'diverse', N'/daɪˈvɜːs/', 'adjective', N'thuộc nhiều loại khác nhau, khác nhau', N'Investors are advised to have diverse portfolios.', N'Các nhà đầu tư được khuyên nên có danh mục đầu tư khác nhau.', 3, 3)
insert into lst_study_topic_vocab values(3, 'evolve', N'/ɪˈvɒlv/', 'verb', N'tiến triển, phát triển', N'Over the years "St. Peter" has evolved into a stock character that is now widely used in jokes, cartoons, comedies, dramas, and plays.', N'Qua nhiều năm, "Thánh Peter" đã trở thành một nhân vật cổ điển được sử dụng rộng rãi trong các câu chuyện cười, phim hoạt hình, hài kịch, phim truyền hình và vở kịch.', 3, 3)
insert into lst_study_topic_vocab values(4, 'feature', N'/ˈfiːtʃə(r)/', 'noun', N'đặc điểm, đặc trưng', N'This cell phone is loved by many people because of its unique features.', N'Chiếc điện thoại này được nhiều người yêu thích bởi những tính năng độc đáo của nó.', 3, 3)
insert into lst_study_topic_vocab values(5, 'generation', N'/ˌdʒenəˈreɪʃn/', 'noun', N'thế hệ, đời', N'The young generation should be taught about the history of the country.', N'Thế hệ trẻ nên được dạy về lịch sử của đất nước.', 3, 3) 
insert into lst_study_topic_vocab values(6, 'inherent', N'ɪnˈherənt/', 'adjective', N'vốn có, cố hữu', N'', N'', 3, 3)
insert into lst_study_topic_vocab values(7, 'migration', N'/maɪˈɡreɪʃn/', 'noun', N'sự di cư', N'', N'', 3, 3)
insert into lst_study_topic_vocab values(8, 'process', N'/ˈprəʊses/', 'noun', N'xử lý (công văn, đơn xin)', N'You should understand that the application process is very difficult.', N'Bạn nên hiểu rằng quá trình xin việc rất khó khăn.', 3, 3)
insert into lst_study_topic_vocab values(9, 'survive', N'/səˈvaɪv/', 'verb', N'còn sống, sống sót', N'The battalion was greatly outnumbered but they somehow managed to survive.', N'Tiểu đoàn bị vượt khá xa về quân số nhưng bằng cách nào đó họ vẫn sống sót.', 3, 3)
insert into lst_study_topic_vocab values(10, 'strait', N'/streɪt/', 'noun', N'eo biển', N'', N'', 3, 3)
insert into lst_study_topic_vocab values(11, 'remarkably', N'/rɪˈmɑːkəbli/', 'adverb', N'đáng kể', N'Recently, the number of people joining the stock market has increased remarkably.', N'Thời gian gần đây, số lượng người tham gia thị trường chứng khoán tăng lên đang kể.', 3, 3)
insert into lst_study_topic_vocab values(12, 'populate', N'/ˈpɒpjuleɪt/', 'verb', N'đến định cư, cư trú', N'The region is so populated.', N'Khu vực rất đông dân cư.', 3, 3)
insert into lst_study_topic_vocab values(13, 'astounding', N'/əˈstaʊndɪŋ/', 'adjective', N'làm kinh ngạc, kinh hoàng', N'The writer''s creative representation of the Seven Deadly Sins was astounding.', N'Sự diễn tả sáng tạo vở kịch "7 trọng tội" của nhà văn đã làm kinh ngạc.', 3, 3)
insert into lst_study_topic_vocab values(14, 'continent', N'/ˈkɒntɪnənt/', 'adjective', N'lục địa, đại lục', N'Their initial voyage was attempting to discover a new continent.', N'Chuyến đi biển ban đầu của họ nhằm cố gắng khám phá một lục địa mới.', 3, 3)
insert into lst_study_topic_vocab values(15, 'region', N'/ˈriːdʒən/', 'noun', N'vùng miền', N'There is a lack of food in this region.', N'Có một sự thiếu hụt lương thực tại khu vực này.', 3, 3) 
insert into lst_study_topic_vocab values(16, 'nomad', N'/ˈnəʊmæd/', 'noun', N'dân du mục, người du mục', N'', N'', 3, 3)
insert into lst_study_topic_vocab values(17, 'resource', N'/rɪˈsɔːs/', 'noun', N'tài nguyên, tài sản', N'The country should focus on enriching human resources.', N'Đất nước nên tập trung vào việc phát triển nguồn nhân lực.', 3, 3)
insert into lst_study_topic_vocab values(18, 'physical', N'/ˈfɪzɪkl/', 'adjective', N'(thuộc) cơ thể, thân thể', N'I''m worried about his physical strength for the next race. He has been training very hard and might be too tired to finish.', N'Tôi lo lắng về thể lực của anh ấy cho cuộc đua tiếp theo. Anh ấy đã tập luyện rất chăm chỉ và có thể quá mệt mỏi để có thể về đích.', 3, 3)
insert into lst_study_topic_vocab values(19, 'desert', N'/ˈdezət/', 'noun', N'sa mạc, bỏ rơi ai', N'The pirate buried his treasure on the deserted island!', N'Cướp biển chôn kho báu của mình trên đảo hoang!', 3, 3)
insert into lst_study_topic_vocab values(20, 'grassland', N'/ˈɡrɑːslænd/', 'noun', N'đồng cỏ', N'I no longer enjoy walking along the path through the grassland.', N'Tôi không còn thích đi bộ dọc theo con đường xuyên qua đồng cỏ nữa.', 3, 3)

insert into lst_study_topic_vocab values(1, 'constraint', N'/kənˈstreɪnt/', 'noun', N'sự ràng buộc, sự hạn chế', N'', N'', 4, 3)
insert into lst_study_topic_vocab values(2, 'contamination', N'/kənˌtæmɪˈneɪʃn/', 'noun', N'sự ô nhiễm', N'Environmental contamination resulting from human activities is a major health concern.', N'Ô nhiễm môi trường do các hoạt động của con người là một mối quan tâm lớn về sức khỏe.', 4, 3)
insert into lst_study_topic_vocab values(3, 'deplete', N'/dɪˈpliːt/', 'verb', N'cạn kiệt, suy yếu', N'', N'', 4, 3)
insert into lst_study_topic_vocab values(4, 'dispose of', N'/dɪˈspəʊz əv/', 'phrasal verb', N'bỏ đi, ném đi', N'', N'', 4, 3)
insert into lst_study_topic_vocab values(5, 'elementally', N'/ˌelɪˈmentəl.li/', 'adverb', N'về cơ bản', N'', N'', 4, 3) 
insert into lst_study_topic_vocab values(6, 'emission', N'/ɪˈmɪʃn/', 'noun', N'sự thải ra (khí, ánh sáng, nhiệt...)', N'The report recommends further reductions in air and noise emissions.', N'Báo cáo khuyến nghị tiếp tục cắt giảm khí thải và tiếng ồn.', 4, 3)
insert into lst_study_topic_vocab values(7, 'extinction', N'/ɪkˈstɪŋkʃn/', 'noun', N'sự tuyệt chủng, sự biến mất', N'This animal is in danger of extinction.', N'Loài động vật này đang có nguy cơ bị tuyệt chủng.', 4, 3)
insert into lst_study_topic_vocab values(8, 'reservoir', N'/ˈrezəvwɑː(r)/', 'noun', N'bể chứa nước, kho, nguồn', N'', N'', 4, 3)
insert into lst_study_topic_vocab values(9, 'shrink', N'/ʃrɪŋk/', 'verb', N'co lại, giảm xuống', N'', N'', 4, 3)
insert into lst_study_topic_vocab values(10, 'stable', N'/ˈsteɪbl/', 'adjective', N'bền vững, vững chắc, ổn định', N'The patient''s condition is stable (= it is not getting worse).', N'Tình trạng của bệnh nhân ổn định (= nó không xấu đi).', 4, 3)
insert into lst_study_topic_vocab values(11, 'consumption', N'/kənˈsʌmpʃn/', 'noun', N'Sự tiêu thụ, (n) sự tiêu dùng', N'Consumption of chicken has decreased dramatically these days due to the bird flu.', N'Lượng tiêu thụ thịt gà những ngày này giảm mạnh do dịch cúm gia cầm.', 4, 3)
insert into lst_study_topic_vocab values(12, 'crude oil', N'/kruːd ɔɪl/', 'noun', N'dầu thô', N'Crude oil is the world''s most important commodity.', N'Dầu thô là mặt hàng quan trọng nhất của thế giới.', 4, 3)
insert into lst_study_topic_vocab values(13, 'reserve', N'/rɪˈzɜːv/', 'noun', N'đặt trước, khu bảo tồn', N'We''d prefer to reserve a table for four at seven o''clock.', N'Chúng tôi muốn đặt một bàn cho bốn người lúc bảy giờ.', 4, 3)
insert into lst_study_topic_vocab values(14, 'underground', N'/ˌʌndəˈɡraʊnd/', 'adjective', N'xe điện ngầm, dưới mặt đất', N'Crickets spend most of their lives underground.', N'Dế sống chủ yếu dưới lòng đất.', 4, 3)
insert into lst_study_topic_vocab values(15, 'biodiesel', N'/ˈbaɪəʊdiːzl/', 'noun', N'dầu diesel sinh học', N'', N'', 4, 3) 
insert into lst_study_topic_vocab values(16, 'modification', N'/ˌmɒdɪfɪˈkeɪʃn/', 'noun', N'sự sửa đổi, sự biến đổi', N'', N'', 4, 3)
insert into lst_study_topic_vocab values(17, 'engine', N'/ˈendʒɪn/', 'noun', N'động cơ, động cơ (máy móc)', N'My father owns an engineering firm.', N'Cha tôi sở hữu một công ty cố vấn công trình.', 4, 3)
insert into lst_study_topic_vocab values(18, 'blend', N'/blend/', 'verb', N'hòa, xay (bằng máy xay)', N'The buildings have been designed to blend in with their surroundings.', N'Các tòa nhà đã được thiết kế để hài hòa với môi trường xung quanh.', 4, 3)
insert into lst_study_topic_vocab values(19, 'witness', N'/ˈwɪtnəs/', 'noun', N'người làm chứng', N'He will appear in court as a witness in the trial.', N'Anh ta sẽ xuất hiện trước tòa với tư cách là nhân chứng trong phiên tòa.', 4, 3)
insert into lst_study_topic_vocab values(20, 'petroleum', N'/pəˈtrəʊliəm/', 'noun', N'xăng dầu, dầu mỏ', N'Petroleum development takes place worldwide.', N'Sự phát triển dầu mỏ diễn ra trên toàn thế giới.', 4, 3)

insert into lst_study_topic_vocab values(1, 'adjust', N'/əˈdʒʌst/', 'verb', N'điều chỉnh, làm cho thích hợp', N'The brakes need to be adjusted.', N'Hệ thống phanh cần được điều chỉnh.', 5, 3)
insert into lst_study_topic_vocab values(2, 'arbitrarily', N'/ˌɑːbɪˈtrerəli/', 'adverb', N'một cách tùy ý', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(3, 'exponentially', N'/ˌekspəˈnenʃəli/', 'adverb', N'theo cấp số nhân', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(4, 'infinitesimal', N'/ˌɪnfɪnɪˈtesɪml/', 'adjective', N'vô cùng, cực kỳ nhỏ', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(5, 'maximize', N'/ˈmæksɪmaɪz/', 'verb', N'tối đa hóa, mở rộng cực đại', N'', N'', 5, 3) 
insert into lst_study_topic_vocab values(6, 'proportion', N'/prəˈpɔːʃn/', 'noun', N'tỉ lệ', N'Loam is a soil with roughly equal proportions of clay, sand and silt.', N'Mùn là một loại đất có tỷ lệ đất sét, cát và phù sa gần bằng nhau.', 5, 3)
insert into lst_study_topic_vocab values(7, 'rate', N'/reɪt/', 'noun', N'mức, giá (giá được tính theo các nấc căn cứ theo chất lượng)', N'The goverment should take action to reduce the unemployment rate.', N'Chính phủ nên hành động để giảm tỷ lệ thất nghiệp.', 5, 3)
insert into lst_study_topic_vocab values(8, 'sequence', N'/ˈsiːkwəns/', 'noun', N'sự nối tiếp, trình tự', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(9, 'valuation', N'/ˌvæljuˈeɪʃn/', 'noun', N'sự đánh giá', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(10, 'effort', N'/ˈefət/', 'noun', N'sự cố gắng, sự nỗ lực', N'You should put greater effort into your studying.', N'Bạn nên nỗ lực nhiều hơn vào việc học của bạn.', 5, 3)
insert into lst_study_topic_vocab values(11, 'obsess', N'/əbˈses/', 'verb', N'ám ảnh, (v) ám ảnh', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(12, 'measurement', N'/ˈmeʒəmənt/', 'noun', N'sự đo lường, phép đo', N'Do you know the exact measurements of your bedroom?', N'Bạn có biết kích thước chính xác của phòng ngủ của mình không?', 5, 3)
insert into lst_study_topic_vocab values(13, 'regardless', N'/rɪˈɡɑːdləs/', 'adverb', N'không quan tâm, không chú ý tới, không đếm xỉa tới, bất chấp', N'Nowadays, people can keep in touch through social networks regardless of distance.', N'
Ngày nay, mọi người có thể liên lạc với nhau thông qua các mạng xã hội bất kể khoảng cách.', 5, 3)
insert into lst_study_topic_vocab values(14, 'track', N'/træk/', 'noun', N'dấu vết; đường, đường đi', N'The girls team were running on the race track.', N'Đội vận động viên nữ đang chạy trên đường đua.', 5, 3)
insert into lst_study_topic_vocab values(15, 'multitask', N'/ˌmʌltiˈtɑːsk/', 'verb', N'chạy cùng lúc nhiều chương trình', N'In computing, multitasking is a method where multiple tasks, also known as processes, are performed during the same period of time.', N'Trong máy tính, chạy cùng lúc nhiều chương trình là một phương pháp trong đó nhiều tác vụ, còn được gọi là quy trình, được thực hiện trong cùng một khoảng thời gian.', 5, 3) 
insert into lst_study_topic_vocab values(16, 'execute', N'/ˈeksɪkjuːt/', 'verb', N'thực hiện, thi hành', N'The crime was very cleverly executed.', N'Tội ác đã được thực hiện rất khéo léo.', 5, 3)
insert into lst_study_topic_vocab values(17, 'priority', N'/praɪˈɒrəti/', 'noun', N'(quyền/sự) ưu tiên, được xét trước', N'Education is currently a priority for developing the country.', N'Giáo dục hiện đang là ưu tiên hàng đầu để phát triển đất nước.', 5, 3)
insert into lst_study_topic_vocab values(18, 'in parallel', N'/ɪn ˈpærəlel/', 'adjective', N'song song, đồng thời', N'', N'', 5, 3)
insert into lst_study_topic_vocab values(19, 'automatically', N'/ˌɔːtəˈmætɪkli/', 'adverb', N'(một cách) tự động, 1 cách tự động', N'If an invoice is not paid within seven days, we automatically send out a reminder.', N'Nếu hóa đơn không được thanh toán trong vòng bảy ngày, chúng tôi sẽ tự động gửi một lời nhắc nhở.', 5, 3)
insert into lst_study_topic_vocab values(20, 'cycle', N'/ˈsaɪkl/', 'noun', N'chu kỳ, chu trình', N'We went for a cycle ride on Sunday.', N'Chúng tôi đã đi xe đạp vào Chủ nhật.', 5, 3)

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
--create proc [dbo].[UserSignup](@userloginname nvarchar(100), @password nvarchar(100), @email nvarchar(100), @CurrentID int output)
--as
--	if(exists(select * from UserAccount where UserLoginName = @userloginname or Email = @email))
--	begin
--		set @CurrentID=-1
--		return
--	end
--	insert into UserAccount(UserLoginName, Password, Email) values(@userloginname, @password, @email)
--	set @CurrentID=@@IDENTITY
--GO



--create procedure User Login--
create proc [dbo].[UserSignin](@email nvarchar(100), @password nvarchar(100))
as
	select * from UserAccount where Email = @email and Password = @password
GO

--create table Favorite
CREATE TABLE [dbo].[Favorite](
	[ID] int IDENTITY(1,1) NOT NULL,
	[UserID] int not null,
	[Word] varchar(50) NULL ,
	PRIMARY KEY CLUSTERED ([ID] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
	ON [PRIMARY]
) ON [PRIMARY]
GO

----select * from Favorite
----Alter table Favorite add Word varchar(50)

select * from UserAccount
--create procedure Proc_AddToFavorite
--exec Proc_AddToFavorite @userid=3, @word='worm', @CurrentID = 2
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc_AddToFavorite](@userid int, @word varchar(50), @CurrentID int output)
as
begin try
	if(exists(select * from Favorite where UserID=@userid and Word=@word))
	begin
		set @CurrentID=0
		return
	end
	insert into Favorite values (@userid, @word)
	set @CurrentID=@@IDENTITY
end try
begin catch
	set @CurrentID=0
end catch
GO

--create procedure Proc_GetListFavorite
--exec Proc_GetListFavorite @userid=4
create proc [dbo].[Proc_GetListFavorite] (@userid int)
as
	select * from Favorite where UserID=@userid
Go

/* Proc_GetAllVocabTopic */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetAllStudyTopic]
as
select * from [dbo].[lst_study_topic]
GO

/* Proc_GetAllStudyLessonByTopic */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetAllStudyLessonByTopic](@topicID int)
as
select * from  [dbo].[lst_study_topic_lesson] where TopicID=@topicID
GO

/* Proc_GetContentByLesson */
SET ANSI_NULLS ON	
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetContentByLesson](@topicID int, @lessonID int)
as
select * from [dbo].[lst_study_topic_vocab] 
where LessonID=@lessonID and TopicID=@topicID
GO

/* Proc_GetStudyTopicByTopicID*/
create proc [dbo].[Proc_GetStudyTopicByTopicID](@topicID int)
as
select * from [dbo].lst_study_topic where TopicID=@topicID


GO
GO
--create procedure User Update--
CREATE PROC [dbo].[UpdateAccount](@userid int, @userloginname nvarchar(100), @email nvarchar(100), @CurrentID int output)
as
begin try
	if(exists(select * from UserAccount where UserLoginName=@userloginname and UserID<>@userid))
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

--Create procedure Change password--
CREATE PROC [dbo].[Proc_ChangePassword](@userid int, @email nvarchar(100), @password nvarchar(100), @CurrentID int output)
as
begin try
	if(exists(select * from UserAccount where Email=@email and UserID<>@userid))
	begin
		set @CurrentID=-1
		return
	end
	update UserAccount set Password = @password where UserID=@userid
	set @CurrentID=@userid
end try
begin catch
	set @CurrentID=0
end catch

--Create procedure Select Email--
CREATE PROC [dbo].[Proc_GetUserByEmail](@email nvarchar(100))
as
	select * from UserAccount where Email=@email

--exec Proc_ChangePassword @userid = 1, @email = 'vi', @password = '000', @CurrentID = 1
--select * from UserAccount

--if(exists(select * from UserAccount where Email=@email))

--exec Proc_GetUserByEmail @email = 'vi'

/* Proc_GetDetailContentLessonByID */
SET ANSI_NULLS ON	
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Proc_GetDetailContentLessonByID](@topicID int, @lessonID int, @id int)
as
select * from [dbo].[lst_study_topic_vocab] 
where LessonID=@lessonID and TopicID=@topicID and ID=@id
GO


----Create table SearchHistory----
create table SearchHistory
(
	[ID] int IDENTITY(1,1) NOT NULL,
	[UserID] int not null,
	[Word] varchar(50) NULL,
	PRIMARY KEY CLUSTERED ([ID] ASC) 
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
	ON [PRIMARY]
) ON [PRIMARY]
GO
--drop table SearchHistory
----Procedure Add word to Search History----
--drop proc Proc_GetListHistoryByUserID
create proc [dbo].[Proc_AddToHistory] (@userid int, @word varchar(50), @CurrentID int output)
as
begin try
	if(exists(select * from SearchHistory where UserID=@userid and Word=@word))
	begin
		set @CurrentID=0
		return
	end
	insert into SearchHistory values (@userid, @word)
	set @CurrentID=@@IDENTITY
end try
begin catch
	set @CurrentID=0
end catch
GO
----Procedure Get list Search History by UserID----
create proc [dbo].[Proc_GetListHistoryByUserID] (@userid int)
as
	select top 10 * from SearchHistory where UserID = @userid order by ID desc
Go
----Procedure Delete word from Search History----
create PROC [dbo].[Proc_DeleteFromHistory](@id int, @CurrentID int output)
as
begin try
	if(not exists(select * from SearchHistory where ID=@id))
	begin
		set @CurrentID=-1
		return
	end
	delete SearchHistory where ID=@id
	set @CurrentID=@id
end try
begin catch
	set @CurrentID=0
end catch

--exec [dbo].[Proc_DeleteFromHistory] @id = 4, @CurrentID = 1
--delete SearchHistory where ID=3
--select top 10 * from SearchHistory where UserID=2 order by ID desc
--select * from UserAccount

--update UserAccount
--set Email = 'a5'
--where Email = 'attv552@gmail.com'

----Procedure Delete word from Favorite----
--exec Proc_DeleteFromFavorite @id=3, @CurrentID=1
create PROC [dbo].[Proc_DeleteFromFavorite](@id int, @CurrentID int output)
as
begin try
	if(not exists(select * from Favorite where ID=@id))
	begin
		set @CurrentID=-1
		return
	end
	delete Favorite where ID=@id
	set @CurrentID=@id
end try
begin catch
	set @CurrentID=0
end catch

--
create table [dbo].[LessonLearnt] (
	[TopicID] int not null,
	[LessonID] int not null,
	[UserID] int not null,
	[Name] varchar(100)null,
	[Learnt] nvarchar(50) null,
	[TotalWords] int null
) 

alter table LessonLearnt add primary key (TopicID, LessonID, UserID)

----
create proc [dbo].[UserSignup1](@userloginname nvarchar(100), @password nvarchar(100), @email nvarchar(100), @CurrentID int output)
as
	if(exists(select * from UserAccount where UserLoginName = @userloginname or Email = @email))
	begin
		set @CurrentID=-1
		return
	end
	insert into UserAccount(UserLoginName, Password, Email) values(@userloginname, @password, @email)
	set @CurrentID=@@IDENTITY
	insert into LessonLearnt (TopicID, LessonID, UserID , Name,TotalWords) values(1,1, @CurrentID,'Health problems',20), 
	(1,2, @CurrentID,'Academic subjects',20), (1,3, @CurrentID,'Travel and adventure',20), (1,4, @CurrentID,'Dimensions',20), (1,5, @CurrentID,'City life',20), (1,6, @CurrentID,'Persuasion',20),
	(1,7, @CurrentID,'Cultural interests',20), (1,8, @CurrentID,'Contrast',20), (1,9, @CurrentID,'Problems and solutions',20), (1,10, @CurrentID,'Ideas',20), 
	(1,11, @CurrentID,'Growing up 1',20), (1,12, @CurrentID,'Growing up 2',20), (1,13, @CurrentID,'Mental and physical development 1',20), (1,14, @CurrentID,'Mental and physical development 2',20), (1,15, @CurrentID,'Keeping fit 1',20),
	(2,1, @CurrentID,'Contracts',12),(2,2, @CurrentID,'Marketing',12),(2,3, @CurrentID,'Warranties',12),(2,4, @CurrentID,'Business Planning',12),(2,5, @CurrentID,'Conferences',12),
	(2,6, @CurrentID,'Computers',12),(2,7, @CurrentID,'Office Technology',12),(2,8, @CurrentID,'Electronics',12),(2,9, @CurrentID,'Warranties',12),(2,10,@CurrentID,'Correspondence',12),
	(2,11, @CurrentID,'Job Adveritising And Recruitment',12),(2,12, @CurrentID,'Applying And Interviewing',12),(2,13, @CurrentID,'Hiring and training',12),(2,14, @CurrentID,'Salaries and Benefits',12),(2,15, @CurrentID,'Promotions, pensions and awards',12),
	(3,1, @CurrentID,'Food crops',20),(3,2, @CurrentID,'Disaster',20),(3,3, @CurrentID,'Evolution and migration',20),(3,4, @CurrentID,'Petronleum alternatives',20),(3,5, @CurrentID,'Time efficiency',20),
	(3,6, @CurrentID,'Ancient life',20),(3,7, @CurrentID,'Computers',20),(3,8, @CurrentID,'Energy',20),(3,9, @CurrentID,'Memory',20),(3,10, @CurrentID,'Spirituality',20),
	(3,11, @CurrentID,'illness',20),(3,12, @CurrentID,'Surgery',20),(3,13, @CurrentID,'Ghosts',20),(3,14, @CurrentID,'Anthropology',20),(3,15, @CurrentID,'Social inequality',20)
	update LessonLearnt set Learnt=N'Chưa hoàn thành' where UserID=@CurrentID
GO

----
create proc [dbo].[Proc_GetListLessonLearntByUserID](@userID int)
as
begin
	select * from LessonLearnt where UserID=@userID
end

create proc [dbo].[Proc_GetEachLessonLearntByLessonID](@lessonID int, @topicID int, @userID int)
as
begin
	select * from LessonLearnt where UserID=@userID and LessonID=@lessonID and TopicID=@topicID
end

create proc [dbo].[Proc_GetListLessonLearntByUserID](@userID int, @topicID int)
as
begin
	select * from LessonLearnt where UserID=@userID and TopicID=@topicID
end

create proc [dbo].[Proc_UpdateLessonLearnt](@lessonID int, @topicID int, @userID int)
as
begin
	update LessonLearnt set Learnt=N'Đã hoàn thành' where UserID=@userID and LessonID=@lessonID and TopicID=@topicID
end

----1

insert into lst_study_topic_vocab values(1, 'poll', N'/pəʊl/', 'noun', N'cuộc điều tra dư luận, cuộc thăm dò ý kiến', N'a public opinion poll', N'cuộc thăm dò dư luận quần chúng', 6, 1)
insert into lst_study_topic_vocab values(2, 'vigorously', N'/ˈvɪɡərəsli/', 'adverb', N'mãnh liệt, mạnh mẽ', N'argue vigorously in support of something', N'lập luận mạnh mẽ để ủng hộ cái gì', 6, 1)
insert into lst_study_topic_vocab values(3, 'bitterly', N'/ˈbɪtəli/', 'adverb', N'thảm thiết, một cách đau buồn/tức giận', N'They complained bitterly', N'Họ phàn nàn một cách tức giận', 6, 1)
insert into lst_study_topic_vocab values(4, 'widely', N'/ˈwaɪdli/', 'adverb', N'rộng rãi, khắp nơi', N'it is widely known that ...', N'khắp nơi người ta đều biết rằng ..., đâu đâu người ta cũng biết rằng ...', 6, 1)
insert into lst_study_topic_vocab values(5, 'idea', N'/aɪˈdɪə/', 'noun', N'ý tưởng, ý kiến', N'a fixed idea', N'quan niệm cố định', 6, 1)
insert into lst_study_topic_vocab values(6, 'dispute', N'/dɪˈspjuːt/', 'noun', N'cuộc bàn cãi, cuộc tranh luận', N'there has been much dispute over the question of legalized abortion', N'người ta đã tranh luận nhiều về vấn đề phá thai hợp pháp', 6, 1)
insert into lst_study_topic_vocab values(7, 'morally', N'/ˈmɒrəli/', 'adverb', N'về phương diện đạo đức, một cách có đạo đức', N'to behave morally', N'cư xử có đạo đức', 6, 1)
insert into lst_study_topic_vocab values(8, 'legislation', N'/ˌledʒɪsˈleɪʃn/', 'noun', N'pháp luật; pháp chế', N'humanity of socialist legislation', N'tính nhân đạo của pháp chế xã hội chủ nghĩa', 6, 1)
insert into lst_study_topic_vocab values(9, 'wholly', N'/ˈhəʊlli/', 'adverb', N'toàn bộ, hoàn toàn', N'I don''t wholly agree', N'tôi không hoàn toàn đồng ý', 6, 1)
insert into lst_study_topic_vocab values(10, 'strongly', N'/ˈstrɒŋli/', 'adverb', N'quả quyết, mãnh mẽ, rất', N'', N'', 6, 1)
insert into lst_study_topic_vocab values(11, 'suggest', N'/səˈdʒest/', 'verb', N'đề nghị; đề xuất; gợi ý', N'He suggests meeting on Monday', N'Anh ấy đề nghị họp vào thứ hai', 6, 1)
insert into lst_study_topic_vocab values(12, 'tentatively', N'/ˈtentətɪvli/', 'adverb', N'không dứt khoát, không quả quyết', N'', N'', 6, 1)
insert into lst_study_topic_vocab values(13, 'otherwise', N'/ˈʌðəwaɪz/', 'adverb', N'khác, cách khác', N'he could not act otherwise', N'anh ta không thể hành động khác hơn được', 6, 1)
insert into lst_study_topic_vocab values(14, 'acknowledge', N'/əkˈnɒlɪdʒ/', 'verb', N'chấp nhận sự thật của cái gì; thừa nhận cái gì', N'he acknowledged it to be true /that it was true', N'anh ấy thừa nhận điều đó là đúng', 6, 1)
insert into lst_study_topic_vocab values(15, 'integrity', N'/ɪnˈteɡrəti/', 'noun', N'tính chính trực, tính liêm chính', N'', N'', 6, 1)
insert into lst_study_topic_vocab values(16, 'justify', N'/ˈdʒʌstɪfaɪ/', 'verb', N'bào chữa; thanh minh', N'you can''t justify neglecting your wife and children', N'anh không thể bào chữa được việc anh lơ là vợ con', 6, 1)
insert into lst_study_topic_vocab values(17, 'publicly', N'/ˈpʌblɪkli/', 'adverb', N'công khai', N'', N'', 6, 1)
insert into lst_study_topic_vocab values(18, 'advocate', N'/ˈædvəkət/', 'verb', N'tán thành, ủng hộ', N'', N'', 6, 1)
insert into lst_study_topic_vocab values(19, 'wisdom', N'/ˈwɪzdəm/', 'noun', N'sự sáng suốt, tài giỏi, khôn ngoan; sự hiểu biết', N'she had acquired much wisdom during her long life', N'bà ta đã tích lũy được nhiều hiểu biết trong cả cuộc đời lâu dài của mình', 6, 1)
insert into lst_study_topic_vocab values(20, 'object', N'/ˈɒbdʒɪkt/', 'verb', N'phản đối; chống lại', N'I objected : "But he''s too young "', N'Tôi phản đối "Nhưng mà nó quá trẻ"', 6, 1)

insert into lst_study_topic_vocab values(1, 'singer', N'/ˈsɪŋə(r)/', 'noun', N'ca sĩ', N'She is a good singer', N'Cô ấy là một ca sĩ tài giỏi', 7, 1)
insert into lst_study_topic_vocab values(2, 'ballet', N'/ˈbæleɪ/', 'noun', N'ba-lê', N'', N'', 7, 1)
insert into lst_study_topic_vocab values(3, 'anthology', N'/ænˈθɒlədʒi/', 'noun', N'bộ sưu tập thơ hoặc văn xuôi về cùng một chủ đề hoặc của một nhà văn; hợp tuyển', N'She has an anthology of love poetry', N'Cô ấy có một hợp tuyển thơ về tình yêu', 7, 1)
insert into lst_study_topic_vocab values(4, 'discussion', N'/dɪˈskʌʃn/', 'noun', N'sự thảo luận; sự bàn cãi; sự tranh luận', N'after much discussion /several lengthy discussions , they decided to accept our offer', N'sau nhiều cuộc bàn cãi/một vài cuộc bàn cãi lê thê, họ quyết định chấp nhận đề nghị của chúng tôi', 7, 1)
insert into lst_study_topic_vocab values(5, 'opera', N'/ˈɒprə/', 'noun', N'nhạc kịch, ô-pê-ra', N'tickets for the opera', N'vé đi xem ô-pê-ra', 7, 1)
insert into lst_study_topic_vocab values(6, 'attend', N'/əˈtend/', 'verb', N'chăm sóc; phục vụ', N'a nurse attends to the patient', N'một y tá chăm sóc cho bệnh nhân', 7, 1)
insert into lst_study_topic_vocab values(7, 'classical', N'/ˈklæsɪkl/', 'adjective', N'cổ điển', N'classical music', N'âm nhạc cổ điển', 7, 1)
insert into lst_study_topic_vocab values(8, 'assemble', N'/əˈsembl/', 'verb', N'(làm cho vật hoặc người) tập hợp lại; thu thập', N'The whole school (was) assembled in the main hall', N'Toàn trường tập hợp trong hội trường', 7, 1)
insert into lst_study_topic_vocab values(9, 'observe', N'/əbˈzɜːv/', 'verb', N'quan sát, theo dõi', N'', N'', 7, 1)
insert into lst_study_topic_vocab values(10, 'amateur', N'/ˈæmətə/', 'noun', N'người chơi một môn thể thao hoặc môn nghệ thuật không nhằm kiếm tiền; người chơi tài tử; nghiệp dư', N'the tournament is open to amateurs as well as professionals', N'cuộc thi đấu được tổ chức cho các đấu thủ nghiệp dư cũng như các đấu thủ chuyên nghiệp', 7, 1)
insert into lst_study_topic_vocab values(11, 'recital', N'/rɪˈsaɪtl/', 'noun', N'(âm nhạc) cuộc biểu diễn độc tấu', N'', N'', 7, 1)
insert into lst_study_topic_vocab values(12, 'orchestra', N'/ˈɔːkɪstrə/', 'noun', N'ban nhạc; dàn nhạc', N'a dance , string , symphony orchestra', N'một dàn nhạc khiêu vũ, đàn dây, giao hưởng', 7, 1)
insert into lst_study_topic_vocab values(13, 'guest', N'/ɡest/', 'noun', N'khách, khách mời', N'a guest speaker', N'người được mời đến để diễn thuyết', 7, 1)
insert into lst_study_topic_vocab values(14, 'resign', N'/rɪˈzaɪn/', 'verb', N'từ chức; từ bỏ', N'He resigned as a police officer after 20 years', N'Anh ấy nghỉ hưu sau 20 năm làm cảnh sát', 7, 1)
insert into lst_study_topic_vocab values(15, 'establish', N'/ɪˈstæblɪʃ/', 'verb', N'lập, thành lập, thiết lập, kiến lập', N'to establish a government', N'lập chính phủ', 7, 1)
insert into lst_study_topic_vocab values(16, 'poetry', N'/ˈpəʊətri/', 'noun', N'thi ca (thơ ca) nói chung; nghệ thuật thơ', N'epic poetry', N'sử thi', 7, 1)
insert into lst_study_topic_vocab values(17, 'organize', N'/ˈɔːɡənaɪz/', 'verb', N'tổ chức', N'', N'', 7, 1)
insert into lst_study_topic_vocab values(18, 'contemporary', N'/kənˈtemprəri/', 'adjective', N'đương thời', N'many contemporary writers condemned the emperor''s actions', N'nhiều nhà văn đương thời lên án các hành động của hoàng đế', 7, 1)
insert into lst_study_topic_vocab values(19, 'drama', N'/ˈdrɑːmə/', 'noun', N'vở kịch cho sân khấu, ra-đi-ô hoặc truyền hình', N'', N'', 7, 1)
insert into lst_study_topic_vocab values(20, 'ceremony', N'/ˈserəməni/', 'noun', N'nghi lễ', N'a marriage /wedding ceremony', N'nghi lễ kết hôn; hôn lễ', 7, 1)


insert into lst_study_topic_vocab values(1, 'price', N'/praɪs/', 'noun', N'số tiền mua hoặc bán cái gì; giá', N'What''s the price of this table?', N'Cái bàn này giá bao nhiêu?', 8, 1)
insert into lst_study_topic_vocab values(2, 'twin', N'/twɪn/', 'adjective', N'sinh đôi; tạo thành cặp', N'my twin brother /sister', N'anh/chị sinh đôi của tôi', 8, 1)
insert into lst_study_topic_vocab values(3, 'markedly', N'/ˈmɑːkɪdli/', 'adverb', N'rõ ràng; rõ rệt', N'', N'', 8, 1)
insert into lst_study_topic_vocab values(4, 'region', N'/ˈriːdʒən/', 'noun', N'vùng, miền', N'a mountainous region', N'miền đồi núi', 8, 1)
insert into lst_study_topic_vocab values(5, 'differ', N'/ˈdɪfə(r)/', 'verb', N'khác, không giống', N'The brothers differ widely in their tastes', N'Mấy anh em khác nhau rất nhiều về sở thích', 8, 1)
insert into lst_study_topic_vocab values(6, 'score', N'/skɔː(r)/', 'noun', N'điểm số; bàn thắng', N'hight score', N'điểm cao', 8, 1)
insert into lst_study_topic_vocab values(7, 'background', N'/ˈbækɡraʊnd/', 'noun', N'phần trong một cảnh quan, cảnh trí hoặc bảng miêu tả làm nền cho những vật hoặc những người chính; nền; hậu cảnh', N'a dress with red spots on a white background', N'áo nền trắng chấm đỏ', 8, 1)
insert into lst_study_topic_vocab values(8, 'equivalent', N'/ɪˈkwɪvələnt/', 'adjective', N'(adj) tương đương; (n) vật tương đương, từ tương đương', N'', N'', 8, 1)
insert into lst_study_topic_vocab values(9, 'distinguish', N'/dɪˈstɪŋɡwɪʃ/', 'verb', N'(to distinguish between A and B / A from B) phân biệt', N'people who cannot distinguish between colours are said to be colour-blind', N'người không phân biệt được màu sắc thì gọi là mù màu', 8, 1)
insert into lst_study_topic_vocab values(10, 'manner', N'/ˈmænə(r)/', 'noun', N'dáng, vẻ, bộ dạng, thái độ, cử chỉ', N'there is no trace of awkwardness in his manner', N'không có một chút gì là vụng về trong thái độ của anh ta', 8, 1)
insert into lst_study_topic_vocab values(11, 'contrast', N'/ˈkɒntrɑːst/', 'noun', N'sự tương phản, sự trái ngược', N'the contrast between light and shade', N'sự tương phản giữa ánh sáng và bóng tối', 8, 1)
insert into lst_study_topic_vocab values(12, 'copy', N'/ˈkɒpi/', 'verb', N'sao lại, chép lại; bắt chước, phỏng theo, mô phỏng', N'to copy out a passage from a book', N'chép lại một đoạn trong sách', 8, 1)
insert into lst_study_topic_vocab values(13, 'resemble', N'/rɪˈzembl/', 'verb', N'giống với, tương tự (người nào, vật gì), có sự tương đồng với', N'a small object resembling a pin', N'một vật nhỏ giống như một chiếc ghim', 8, 1)
insert into lst_study_topic_vocab values(14, 'evidence', N'/ˈevɪdəns/', 'noun', N'(evidence to do something/that ...) (pháp lý) chứng cớ; bằng chứng', N'there wasn''t enough evidence to prove him guilty', N'không có đủ bằng chứng để chứng tỏ là nó có tội (không đủ chứng cớ buộc tội nó)', 8, 1)
insert into lst_study_topic_vocab values(15, 'estimate', N'/ˈestɪmeɪt/', 'verb', N'đánh giá; ước lượng', N'', N'', 8, 1)
insert into lst_study_topic_vocab values(16, 'alike', N'/əˈlaɪk/', 'adjective', N'giống nhau, tương tự', N'those four chairs are alike', N'bốn cái ghế ấy thì giống nhau', 8, 1)
insert into lst_study_topic_vocab values(17, 'genetically', N'/dʒəˈnetɪkli/', 'adverb', N'về mặt di truyền học, có liên quan đến khía cạnh di truyền', N'', N'', 8, 1)
insert into lst_study_topic_vocab values(18, 'variety', N'/vəˈraɪəti/', 'noun', N'sự đa dạng, tính chất không như nhau; trạng thái khác nhau, trạng thái muôn màu muôn vẻ; tính chất bất đồng', N'we all need variety in our diet', N'tất cả chúng tôi đều cần có chế độ ăn luôn luôn thay đổi', 8, 1)
insert into lst_study_topic_vocab values(19, 'compare', N'/kəmˈpeə(r)/', 'verb', N'so sánh; ví (như)', N'If you compare her work with his /If you compare their work , you''ll find hers is much better', N'Nếu anh so sánh tác phẩm của cô ấy với tác phẩm của anh ta/Nếu anh so sánh tác phẩm của họ với nhau, anh sẽ thấy tác phẩm của cô ấy hay hơn nhiều', 8, 1)
insert into lst_study_topic_vocab values(20, 'distinct', N'/dɪˈstɪŋkt/', 'adjective', N'riêng, riêng biệt; khác biệt', N'man is distinct from animals', N'con người khác biệt với loài vật', 8, 1)

insert into lst_study_topic_vocab values(1, 'exacerbate', N'/ɪɡˈzæsəbeɪt/', 'verb', N'làm tăng, làm trầm trọng (bệnh, sự tức giận, sự đau đớn)', N'', N'', 9, 1)
insert into lst_study_topic_vocab values(2, 'symptom', N'/ˈsɪmptəm/', 'noun', N'triệu chứng (của một căn bệnh); dấu hiệu về sự tồn tại của một cái gì xấu', N'This demonstration was a symptom of discontent among the students', N'Cuộc biểu tình này là dấu hiệu của sự bất mãn trong sinh viên', 9, 1)
insert into lst_study_topic_vocab values(3, 'political', N'/pəˈlɪtɪkl/', 'adjective', N'về chính trị, về chính phủ, về những việc công cộng nói chung', N'political economy', N'kinh tế chính trị', 9, 1)
insert into lst_study_topic_vocab values(4, 'prospect', N'/ˈprɒspekt/', 'noun', N'cái nhìn rộng về một phong cảnh; cảnh; toàn cảnh', N'a magnificent prospect of mountain peaks and lakes', N'toàn cảnh tuyệt đẹp các đỉnh núi và hồ', 9, 1)
insert into lst_study_topic_vocab values(5, 'eradicate', N'/ɪˈrædɪkeɪt/', 'verb', N'xóa bỏ, diệt', N'', N'', 9, 1)
insert into lst_study_topic_vocab values(6, 'conflict', N'/ˈkɒnflɪkt/', 'noun', N'sự xung đột; cuộc xung đột', N'soldiers involved in armed conflict', N'những người lính tham dự vào một cuộc xung đột vũ trang', 9, 1)
insert into lst_study_topic_vocab values(7, 'problem', N'/ˈprɒbləm/', 'noun', N'cái khó giải quyết hoặc khó hiểu; vấn đề, luận đề', N'How do you cope with the problem of poor vision ?', N'Anh đối phó thế nào với vấn đề thị lực kém?', 9, 1)
insert into lst_study_topic_vocab values(8, 'condition', N'/kənˈdɪʃn/', 'noun', N'điều kiện, tình trạng', N'You may shut the doors on (upon) condition that nobody smokes in the room', N'Anh có thể đóng cửa với điều kiện không ai hút thuốc trong phòng', 9, 1)
insert into lst_study_topic_vocab values(9, 'severe', N'/sɪˈvɪə(r)/', 'adjective', N'khắt khe, gay gắt (trong thái độ, cách cư xử)', N'a severe look', N'một cái nhìn nghiêm khắc', 9, 1)
insert into lst_study_topic_vocab values(10, 'complication', N'/ˌkɒmplɪˈkeɪʃn/', 'noun', N'sự phức tạp, sự rắc rối', N'', N'', 9, 1)
insert into lst_study_topic_vocab values(11, 'intervene', N'/ˌɪntəˈviːn/', 'verb', N'xen vào, can thiệp', N'to intervene in a quarrel', N'xen vào một cuộc cãi cọ', 9, 1)
insert into lst_study_topic_vocab values(12, 'damage', N'/ˈdæmɪdʒ/', 'noun', N'(damage to something) sự thiệt hại; sự hư hại', N'The accident did a lot of damage to the car', N'Tai nạn khiến chiếc xe bị hư hại nặng', 9, 1)
insert into lst_study_topic_vocab values(13, 'crisis', N'/ˈkraɪsɪs/', 'noun', N'sự khủng hoảng; cơn khủng hoảng', N'in times of crisis , it''s good to have a friend to turn to', N'Trong những lúc khủng hoảng, có một người bạn để trông cậy là một điều tốt lành', 9, 1)
insert into lst_study_topic_vocab values(14, 'tension', N'/ˈtenʃn/', 'noun', N'(nghĩa bóng) sự căng thẳng (về tinh thần, cảm xúc, thần kinh); tình trạng căng thẳng', N'Tension is a major cause of heart disease', N'Tình trạng căng thẳng là nguyên nhân chủ yếu của bệnh tim', 9, 1)
insert into lst_study_topic_vocab values(15, 'dilemma', N'/dɪˈlemə/', 'noun', N'thế tiến lui đều khó, thế tiến thoái lưỡng nan, tình trạng khó xử', N'between (on ) the horns of a dilemma', N'tiến không được mà lùi chẳng xong, tiến thoái lưỡng nan', 9, 1)
insert into lst_study_topic_vocab values(16, 'cash', N'/kæʃ/', 'noun', N'tiền, tiền mặt', N'I have no cash with me', N'Tôi không có tiền mặt', 9, 1)
insert into lst_study_topic_vocab values(17, 'resolve', N'/rɪˈzɒlv/', 'noun', N'giải quyết (khó khăn, vấn đề, mối nghi ngờ...)', N'', N'', 9, 1)
insert into lst_study_topic_vocab values(18, 'pose', N'/pəʊz/', 'noun', N'sắp đặt (ai...) ở tư thế (chụp ảnh, làm mẫu vẽ...)', N'', N'', 9, 1)
insert into lst_study_topic_vocab values(19, 'solve', N'/sɒlv/', 'verb', N'giải quyết (khó khăn..)', N'', N'', 9, 1)
insert into lst_study_topic_vocab values(20, 'face', N'/feɪs/', 'verb', N'đương đầu, đối phó', N'to face famine and poverty', N'đương đầu với nạn đói nghèo', 9, 1)

insert into lst_study_topic_vocab values(1, 'compelling', N'/kəmˈpelɪŋ/', 'adjective', N'hấp dẫn, thuyết phục', N'a compelling commentary', N'bài bình luận hấp dẫn', 10, 1)
insert into lst_study_topic_vocab values(2, 'dogma', N'/ˈdɒɡmə/', 'noun', N'niềm tin hoặc một loạt niềm tin do một quyền lực nào đó đưa ra (nhất là Giáo hội) để được chấp nhận như một đức tin; giáo điều; tín điều', N'political /social /economic dogma', N'tín điều chính trị/xã hội/kinh tế', 10, 1)
insert into lst_study_topic_vocab values(3, 'question', N'/ˈkwestʃən/', 'noun', N'câu hỏi; vấn đề; điều bàn đến, điều nói đến', N'What about the question of employment ?', N'Vấn đề công ăn việc làm thì thế nào?', 10, 1)
insert into lst_study_topic_vocab values(4, 'sample', N'/ˈsɑːmpl/', 'noun', N'mẫu; vật mẫu, hàng mẫu', N'to send something as a sample', N'gửi vật gì để làm mẫu', 10, 1)
insert into lst_study_topic_vocab values(5, 'comment', N'/ˈkɒment/', 'noun', N'lời bình luận; lời phê bình, lời chỉ trích', N'to make comments on an event', N'bình luận một sự kiện', 10, 1)
insert into lst_study_topic_vocab values(6, 'concept', N'/ˈkɒnsept/', 'noun', N'tư tưởng làm cơ sở cho cái gì; ý niệm chung; khái niệm', N'He can''t grasp the basic concepts of mathematics', N'Anh ấy không nắm được những khái niệm cơ bản của toán học', 10, 1)
insert into lst_study_topic_vocab values(7, 'freedom', N'/ˈfriːdəm/', 'noun', N'sự tự do; nền tự do', N'to fight for freedom', N'đấu tranh giành tự do', 10, 1)
insert into lst_study_topic_vocab values(8, 'democracy', N'/dɪˈmɒkrəsi/', 'noun', N'nền dân chủ; chế độ dân chủ', N'parliamentary democracy', N'nền dân chủ đại nghị; chế độ dân chủ đại nghị', 10, 1)
insert into lst_study_topic_vocab values(9, 'justice', N'/ˈdʒʌstɪs/', 'noun', N'sự công bằng; phẩm chất công bằng', N'Laws based on the principles of justice', N'Pháp luật dựa trên các nguyên tắc công bằng', 10, 1)
insert into lst_study_topic_vocab values(10, 'conjecture', N'/kənˈdʒektʃə(r)/', 'noun', N'sự phỏng đoán, sự ước đoán', N'to be right in a conjecture', N'phỏng đoán đúng', 10, 1)
insert into lst_study_topic_vocab values(11, 'consensus', N'/kənˈsensəs/', 'noun', N'sự đồng lòng, sự đồng tâm, sự nhất trí', N'The two parties have reached a consensus', N'Hai đảng đó đã được một sự nhất trí', 10, 1)
insert into lst_study_topic_vocab values(12, 'framework', N'/ˈfreɪmwɜːk/', 'noun', N'(nghĩa bóng) cơ cấu tổ chức, khuôn khổ', N'the framework of society', N'cơ cấu xã hội', 10, 1)
insert into lst_study_topic_vocab values(13, 'ambiguous', N'/æmˈbɪɡjuəs/', 'adjective', N'có nhiều hơn một nghĩa có thể hiểu; lưỡng nghĩa; mơ hồ, nhập nhằng', N'an ambiguous explanation', N'lời giải thích mơ hồ', 10, 1)
insert into lst_study_topic_vocab values(14, 'biased', N'/ˈbaɪəst/', 'adjective', N'thiên vị', N'', N'', 10, 1)
insert into lst_study_topic_vocab values(15, 'credible', N'/ˈkredəbl/', 'adjective', N'đáng tin, tin được', N'', N'', 10, 1)
insert into lst_study_topic_vocab values(16, 'flawed', N'/flɔːd/', 'adjective', N'có vết, rạn nứt; có chỗ hỏng; không hoàn thiện, không hoàn mỹ', N'', N'', 10, 1)
insert into lst_study_topic_vocab values(17, 'valid', N'/ˈvælɪd/', 'adjective', N'hợp lý; đúng đắn; có cơ sở/căn cứ vững chắc', N'a valid argument', N'một lý lẽ vững chắc', 10, 1)
insert into lst_study_topic_vocab values(18, 'result', N'/rɪˈzʌlt/', 'noun', N'(result of something) kết quả (của cái gì)', N'The flight was delayed as a result of fog', N'Chuyến bay bị muộn vì sương mù', 10, 1)
insert into lst_study_topic_vocab values(19, 'reason', N'/ˈriːzn/', 'noun', N'(reason for something/doing something ; reason to do something) lý do', N'Is there any (particular) reason why you can''t come?', N'Có lý do (đặc biệt) gì mà anh không đến được?', 10, 1)
insert into lst_study_topic_vocab values(20, 'referee', N'/ˌrefəˈriː/', 'noun', N'(thể dục,thể thao) trọng tài (trong bóng đá..)', N'', N'', 10, 1)


------2

insert into lst_study_topic_vocab values(1, 'access', N'/ˈækses/', 'noun', N'quyền truy cập, sự tiếp cận', N'I cannot easily get access to the Internet.', N'Tôi không thể dễ dàng có được quyền truy cập vào Internet', 6, 2)
insert into lst_study_topic_vocab values(2, 'allocate', N'/ˈælԥkeɪt/', 'verb', N'cấp cho, phân phối', N'The office manager did not allocate enough money to purchase software.', N'Người quản lý văn phòng không cấp đủ tiền để mua sắm phần mềm.', 6, 2)
insert into lst_study_topic_vocab values(3, 'compatible', N'/kəmˈpætəbl/', 'adjective', N'tương thích, hợp nhau', N'Because my girlfriend and I listen to the same music artists, we have compatible tastes in music.', N'Vì tôi và bạn gái tôi cùng nghe nhạc của những ngh͏ệ sĩ giống nhau, nên chúng tôi hợp nhau về thị hiếu âm nhạc.', 6, 2)
insert into lst_study_topic_vocab values(4, 'delete', N'/diˈli:t/', 'verb', N'xóa đi, bỏ đi', N'The technicians deleted all the data on the disk accidentally.', N'Kỹ thuật viên đã vô tình xóa mọi dữ li͏ệu trên đĩa.', 6, 2)
insert into lst_study_topic_vocab values(5, 'display', N'/disˈplei/', 'verb', N'hiển thị, trình bày', N'The accounting program displays a current balance when opened.', N'Chương trình kế toán hiển thị một con số cân bằng thu chi khi mở (chương trình đó) ra.', 6, 2)
insert into lst_study_topic_vocab values(6, 'duplicate', N'/ˈdju:plikit/', 'verb', N'sao lại, nhân đôi', N'I think the new word processing program will duplicate the success of the one introduced last year.', N'Tôi nghĩ rằng chương trình xử lý văn bản mới sẽ thành công gấp đôi so với chương trình được giới thi͏ệu hồi năm ngoái.', 6, 2)
insert into lst_study_topic_vocab values(7, 'failure', N'/ˈfeɪljə/', 'noun', N'trượt, thất bại', N'The success or failure of the plan depends on you.', N'Kế hoạch thành công hay thất bại là phụ thuộc vào bạn.', 6, 2)
insert into lst_study_topic_vocab values(8, 'figure out', N'/ˈfɪɡə aʊt/', 'verb', N'đoán ra, giải ra', N'By examining all of the errors, the technicians were able to figure out how to fix the problem.', N'Bằng cách xem xét mọi lỗi, các kỹ thuật viên đã có thể tìm ra cách để sửa chữa các sự cố.', 6, 2)
insert into lst_study_topic_vocab values(9, 'ignore', N'/igˈnɔ:/', 'verb', N'bỏ qua, phớt lờ', N'He ignored all the things she said.', N'Anh ấy phớt lờ tất cả những gì cô ấy nói.', 6, 2)
insert into lst_study_topic_vocab values(10, 'search', N'/sɜːtʃ/', 'noun', N'cuộc tìm kiếm, thăm dò', N'Our search of the database produced very little information.', N'Vi͏ệc tìm kiếm trong cơ sở dữ li͏ệu của chúng tôi đã đem lại rất ít thông tin.', 6, 2)
insert into lst_study_topic_vocab values(11, 'shut down', N'/ʃʌt daʊn/', 'verb', N'tắt máy, ngừng hoạt động', N'Please shut down the computer before you leave.', N'Vui lòng tắt máy trước khi bạn ngừng làm vi͏ệc.', 6, 2)
insert into lst_study_topic_vocab values(12, 'warning', N'/ˈwɔ:niɳ/', 'noun', N'sự cảnh báo', N'The red flashing light gives a warning to users that the battery is low.', N'Ánh sáng nhấp nháy màu đỏ đưa ra sự cảnh báo với người dùng rằng pin bị cạn.', 6, 2)

insert into lst_study_topic_vocab values(1, 'affordable', N'/əˈfɔːdəbəl/', 'adjective', N'có đủ điều ki͏ện, có thể chi trả, giá cả phải chăng', N'The company''s first priority was to find an affordable phone system.', N'Ưu tiên trước hết của công ty là tìm một h͏ệ thống đi͏ện thoại có đủ khả năng (hoạt động).', 7, 2)
insert into lst_study_topic_vocab values(2, 'as needed', N'/az niːdɪd/', 'adverb', N'lúc cần thiết, như cần thiết', N'The service contract states that repairs will be made on a basis as needed.', N'Hợp đồng dịch vụ nói rằng việ͏c sửa chữa sẽ được thực hi͏ện dựa trên cơ sở lúc cần thiết.', 7, 2)
insert into lst_study_topic_vocab values(3, 'be in charge of', N'/bi: ɪn tʃɑːdʒ əv/', 'verb', N'chịu trách nhi͏ệm về', N'He appointed someone to be in charge of maintaining a supply of paper in the fax machine.', N'Ông ấy chọn người nào đó chịu trách nhi͏ệm duy trì vi͏ệc cung cấp giấy cho máy fax.', 7, 2)
insert into lst_study_topic_vocab values(4, 'capacity', N'/kəˈpæsəti/', 'noun', N'sức chứa, dung tích', N'The new conference room is much larger and has a capacity of one hundred people.', N'Phòng họp mới thì lớn hơn nhiều (phòng cũ) và có khả năng chứa được một trăm người.', 7, 2)
insert into lst_study_topic_vocab values(5, 'durable', N'/ˈdjʊərəbl/', 'adjective', N'bền, lâu', N'These chairs are more durable than the first ones we looked at.', N'Những cái ghế này bền hơn nhiều những cái ghế đầu tiên mà chúng ta đã thấy.', 7, 2)
insert into lst_study_topic_vocab values(6, 'initiative', N'/ɪˈnɪʃətɪv/', 'noun', N'bước khởi đầu, sự khởi xướng, sáng kiến', N'Take the initiative and engage your classmates in friendly conversation.', N'Hãy khởi xướng và thu hút các bạn cùng lớp tham gia vào một cuộc nói chuy͏ện thân thi͏ện.', 7, 2)
insert into lst_study_topic_vocab values(7, 'physically', N'/ˈfɪzɪkli /', 'adverb', N'về thân thể, thể chất', N'The computer screen is making her physically sick.', N'Màn hình máy tính khiến cho cô ta khó ch͓u về mặt thể chất.', 7, 2)
insert into lst_study_topic_vocab values(8, 'provider', N'/prəˈvaɪdə(r)/', 'noun', N'nhà cung cấp', N'The department was extremely pleased with the service they received from the phone provider.', N'Bộ phận hết sức hài lòng với dịch vụ mà họ nhận được từ nhà cung cấp dịch vụ đi͏ện thoại.', 7, 2)
insert into lst_study_topic_vocab values(9, 'recur', N'/rɪˈkɜː(r)/', 'verb', N'tái diễn, lặp đi lặp lại', N'The managers did not want that particular error to recur.', N'Các trưởng phòng không muốn những lỗi cá bi͏ệt đó lại tái diễn.', 7, 2)
insert into lst_study_topic_vocab values(10, 'reduction', N'/riˈdʌkʃn/', 'noun', N': sự giảm, thu nhỏ', N'The outlet store gave a 20 percent reduction in the price of the shelves and bookcases.', N'Cửa hàng tiêu thụ đã giảm giá 20% với các k͏ệ sách và tủ sách.', 7, 2)
insert into lst_study_topic_vocab values(11, 'stay on top of', N'/steɪ ɒn tɒp əv/', 'verb', N'nắm bắt tình hình', N'In this industry, you must stay on top of current developments.', N'Trong ngành công nghi͏p này, anh phải nắm bắt được tình hình về các diễn biến hi͏ện tại.', 7, 2)
insert into lst_study_topic_vocab values(12, 'stock', N'/stɒk/', 'verb', N'trữ hàng', N'The employees stocked the shelves on a weekly basis.', N'Các nhân viên trữ hàng lên k͏ệ căn cứ theo mỗi tuần.', 7, 2)


insert into lst_study_topic_vocab values(1, 'appreciation', N'/əˌpriːʃiˈeɪʃn/', 'noun', N'sự cảm kích', N'She shows little appreciation of good music.', N'Cô ấy cho thấy một chút sự đánh giá cao về thẩm mỹ âm nhạc tốt.', 8, 2)
insert into lst_study_topic_vocab values(2, 'be made of', N'/bi: meɪd əv/', 'verb', N'làm bằng (cái gì)', N'This job will really test what you are made of.', N'Công vi͏ệc này sẽ thật sự kiểm tra xem anh là người thế nào.', 8, 2)
insert into lst_study_topic_vocab values(3, 'bring in', N'/brɪŋ ɪn/', 'verb', N'tuyển dụng, dẫn tới', N'The company brings in new team of project planners.', N'Công ty thuê một đợi mới cho các nhà hoạch định dự án.', 8, 2)
insert into lst_study_topic_vocab values(4, 'casually', N'/ˈkæʒuəli/', 'adverb', N'bình thường, không trịnh trọng', N'On Fridays, most employees dress casually.', N'Vào các thứ Sáu, phần lớn nhân viên ăn mặc tùy ý (không mặc đồng phục).', 8, 2)
insert into lst_study_topic_vocab values(5, 'code', N'/koud/', 'noun', N'quy tắc, luật l͏ệ', N'Even the most traditional companies are changing their dress code to something less formal.', N'Thậm chí hầu hết các công ty theo lối cổ cũng đang thay đổi quy tắc ăn mặc của họ sao cho bớt trịnh trọng đi.', 8, 2)
insert into lst_study_topic_vocab values(6, 'expose', N'/iksˈpouz/', 'verb', N'phơi bày, bộc lộ', N'He did not want to expose his fears and insecurity to anyone.', N'Anh ấy không muốn để lộ sự sợ hãi và bất an củaa mình cho bất cứ ai.', 8, 2)
insert into lst_study_topic_vocab values(7, 'glimpse', N'/ɡlɪmps/', 'noun', N'cái nhìn lướt qua', N'The secretary caught a glimpse of her new boss as she was leaving the office.', N'Cô thư ký bắt gặp ánh mắt lướt qua của người chủ mỗi khi cô ấy rời khỏi văn phòng.', 8, 2)
insert into lst_study_topic_vocab values(8, 'out of', N'/aʊt əv/', 'adjective', N'hết, không còn', N'The presenter ran out of time before he reached his conclusion.', N'Người dẫn chương trình đã hết thời gian trước khi anh ta đi đến kết luận.', 8, 2)
insert into lst_study_topic_vocab values(9, 'outdated', N'/autˈdeitid/', 'adjective', N'hết hạn; lỗi thời, lạc hậu, hiện nay không còn dùng', N'Before you do a mailing, make sure that none of the addresses is outdated.', N'Trước khi anh gửi thư, hãy bảo đảm rằng không có địa chỉ nào hi͏ện không còn sử dụng', 8, 2)
insert into lst_study_topic_vocab values(10, 'practice', N'/ˈpræktis/', 'verb', N'thực hành, rèn luy͏ện', N'Bill practiced answering the telephone until he was satisfied.', N'Bill thực tập trả lời đi͏n thoại cho đến khi anh ta cảm thấy hài lòng.', 8, 2)
insert into lst_study_topic_vocab values(11, 'reinforce', N'/,ri:inˈfɔ:s/', 'verb', N'tăng cường, củng cố', N'Employees reinforced their learning with practice in the workplace.', N'Các nhân viên củng cố kiến thức của mình bằng vi͏ệc thực hành ở nơi làm vi͏ệc.', 8, 2)
insert into lst_study_topic_vocab values(12, 'verbally', N'/ˈvɜːbəli/', 'adverb', N'bằng mi͏ệng, bằng lời nói', N'The guarantee was made only verbally.', N'Sự bảo đảm được cam kết chỉ bằng lời.', 8, 2)

insert into lst_study_topic_vocab values(1, 'disk', N'/disk/', 'noun', N'đĩa (vi tính, thể thao, đĩa hát...)', N'Rewritable compact disks are more expensive than read-only CDs.', N'Đĩa quang có khả năng ghi thì đắt hơn nhiều đĩa CD chỉ đọc.', 9, 2)
insert into lst_study_topic_vocab values(2, 'facilitate', N'/fəˈsɪlɪteɪt/', 'verb', N'làm cho dễ dàng, làm cho thuận ti͏ện', N'The computer program facilitated the scheduling of appointments.', N'Chương trình máy tính làm cho vi͏ệc lập lịch các buổi hẹn được thuận lợi.', 9, 2)
insert into lst_study_topic_vocab values(3, 'network', N'/ˈnetwɜːk/', 'verb', N'kết nối, liên kết', N'More and more PCs are networked together.', N'Ngày càng nhiều máy tính được kết nối với nhau.', 9, 2)
insert into lst_study_topic_vocab values(4, 'popularity', N'/,pɔpjuˈlæriti/', 'noun', N'‹tính/sự› đại chúng, phổ biến, nổi tiếng', N'This brand of computers was at the height of its popularity.', N'Thương hiệ͏u máy tính này từng nổi tiếng rất nhiều.', 9, 2)
insert into lst_study_topic_vocab values(5, 'process', N'/ˈprəʊses/', 'noun', N'quá trình', N'Singing contests usually have the same process: auditions, semi-finals, and finals.', N'Các cuộc thi ca hát thường có quá trình giống nhau: thử giọng, bán kết, và chung kết.', 9, 2)
insert into lst_study_topic_vocab values(6, 'replace', N'/riˈpleis/', 'verb', N'thay thế', N'My father replaced the old plug with a new one.', N'Ba tôi thay thế cái nắp cũ bằng cái mới.', 9, 2)
insert into lst_study_topic_vocab values(7, 'revolution', N'/,revəˈlu:ʃn/', 'noun', N'cuộc cách mạng', N'We see a revolution in the computer field almost every day.', N'Chúng ta thấy một cuộc cách mạng trong lĩnh vực máy tính hầu như mỗi ngày.', 9, 2)
insert into lst_study_topic_vocab values(8, 'sharp', N'/ʃɑ:p/', 'adjective', N'thông minh, láu lĩnh', N'The new employee proved how sharp she was when she mastered the new program in a few days.', N'Nhân viên mới đã chứng tỏ được cô ấy thông minh đến thế nào khi mà cô đã làm chủ được chương trình mới trong vài ngày.', 9, 2)
insert into lst_study_topic_vocab values(9, 'skill', N'/skil/', 'noun', N'kỹ năng, kỹ xảo', N'The software developer has excellent technical skills and would be an asset to our software programming team.', N'Người phát triển phần mềm có những kỹ năng chuyên môn xuất sắc và là một vốn quý đối với đội ngũ lập trình phần mềm của chúng tôi.', 9, 2)
insert into lst_study_topic_vocab values(10, 'software', N'/ˈsɒftweə(r)/', 'noun', N'phần mềm, chương trình máy tính', N'Many computers come pre-loaded with software.', N'Nhiều máy tính đã có sẵn phần mềm.', 9, 2)
insert into lst_study_topic_vocab values(11, 'store', N'/stɔ:/', 'verb', N'lưu giữ, tích trữ', N'You can store more data on a zip drive.', N'Anh có thể lưu trữ dữ liệu nhiều hơn trên ổ đĩa nén.', 9, 2)
insert into lst_study_topic_vocab values(12, 'technically', N'/ˈteknɪkli/', 'adverb', N'nói đến/nói về mặt kỹ thuật; một cách chuyên môn/nghiêm túc', N'Technically speaking, the virus infected only script files.', N'Nói về mặt kỹ thuật thì virus chỉ tác động lên các tập tin script (tập tin kịch bản thi hành).', 9, 2)

insert into lst_study_topic_vocab values(1, 'assemble', N'/əˈsembl/', 'verb', N'thu thập, tập hợp, lắp ráp', N'All the students were asked to assemble in the main hall.', N'Tất cả các sinh viên được yêu cầu tập hợp ở hội trường chính.', 10, 2)
insert into lst_study_topic_vocab values(2, 'beforehand', N'/biˈfɔ:hænd/', 'adverb', N'có sẵn, trước', N'To speed up the mailing, we should prepare the labels beforehand.', N'Để tăng tốc gửi thư, chúng ta nên chuẩn bị nhãn trước.', 10, 2)
insert into lst_study_topic_vocab values(3, 'complication', N'/ˌkɑːmplɪˈkeɪʃn/', 'noun', N'sự phức tạp, sự rắc rối', N'She will have to spend two more days in the hospital due to complications during the surgery.', N'Cô sẽ phải mất hai ngày nữa trong b͏ệnh vi͏ện do biến chủng trong khi phẫu thuật.', 10, 2)
insert into lst_study_topic_vocab values(4, 'courier', N'/ˈkʊriər/', 'noun', N'người đưa thư, người chuyển phát', N'We hired a courier to deliver the package.', N'Chúng tôi đã thuê một người đưa thư để phân phát các kiệ͏n hàng.', 10, 2)
insert into lst_study_topic_vocab values(5, 'express', N'/iksˈpres/', 'adjective', N'nhanh, hỏa tốc, tốc hành.', N'It''s important that this document be there tomorrow, so please send it express mail.', N'Vi͏ệc tài li͏ệu này phải có ở chổ ngày mai vì nó rất quan trọng, do đó nên hãy gửi thư chuyển phát nhanh.', 10, 2)
insert into lst_study_topic_vocab values(6, 'fold', N'/fould/', 'verb', N'gập, gấp', N'You should fold the omelette in half.', N'Bạn nên gập trứng rán làm đôi.', 10, 2)
insert into lst_study_topic_vocab values(7, 'layout', N'/ˈleɪaʊt/', 'noun', N'sự bố trí trang giấy', N'There is no single correct layout for business letters.', N'Trong thư thương mại thì không có bố cục nào là chuẩn hoàn toàn hết cả.', 10, 2)
insert into lst_study_topic_vocab values(8, 'mention', N'/ˈmenʃn/', 'verb', N'nói đến, đề cập đếm, đề xuất', N'You should mention in the letter that we can arrange for mailing the brochures as well as printing them.', N'Anh nên đề cập trong thư rằng chúng ta có thể thu xếp gửi (thư) tờ bướm cũng như là in ấn chúng.', 10, 2)
insert into lst_study_topic_vocab values(9, 'petition', N'/pəˈtɪʃn/', 'noun', N'đơn kiến nghị, đơn thỉnh cầu', N'The petition was photocopied and distributed to workers who will collect the neccessary signatures', N'Đơn kiến nghị được photocopy và phân phát đến những công nhân nào sẽ thu thập chữ ký cần thiết.', 10, 2)
insert into lst_study_topic_vocab values(10, 'proof', N'/proof/', 'noun', N'bằng chứng, chứng cớ', N'These results are a further proof of his ability.', N'Những kết quả này là một bằng chứng nữa về khả năng của ông.', 10, 2)
insert into lst_study_topic_vocab values(11, 'register', N'ˈredʒɪstər', 'verb', N'đăng ký', N'You can register this mail for an additional $2.2.', N'Anh ấy có thể gửi đảm bảo thư này với một khoản 2.2 đô-la phí bổ sung.', 10, 2)
insert into lst_study_topic_vocab values(12, 'revise', N'/riˈvaiz/', 'verb', N'đọc lại, xem lại, duy͏ệt lại, sửa lại (bản in thử, đạo luật...)', N'', N'', 10, 2)
------3

insert into lst_study_topic_vocab values(1, 'cover', N'/ˈkʌvər/', 'verb', N'bao phủ, che phủ', N'She covered her face with her hands.', N'Cô lấy tay che mặt.', 6, 3)
insert into lst_study_topic_vocab values(2, 'adjacent', N'/əˈdʒeɪsnt/', 'adjective', N'kế bên, liền kề, sát cạnh', N'The vineyards of Verzy lie adjacent to those of Verzenay.', N'Những vườn nho của Verzy nằm liền kề với những vườn nho của Verzenay.', 6, 3)
insert into lst_study_topic_vocab values(3, 'compress', N'/kəmˈpres/', 'verb', N'ép, đè nén', N'As more snow fell, the bottom layer was compressed into ice.', N'Khi tuyết rơi nhiều hơn, lớp dưới cùng bị nén thành băng.', 6, 3)
insert into lst_study_topic_vocab values(4, 'feasible', N'/ˈfiːzəbl/', 'adjective', N'khả thi', N'It''s just not feasible to manage the business on a part-time basis.', N'Việc quản lý doanh nghiệp trên cơ sở bán thời gian là không khả thi.', 6, 3)
insert into lst_study_topic_vocab values(5, 'gut', N'/ɡʌt/', 'noun', N'ruột, nội tạng', N'It can take up to 72 hours for food to pass through the gut.', N'Có thể mất đến 72 giờ để thức ăn đi qua ruột.', 6, 3)
insert into lst_study_topic_vocab values(6, 'integral', N'/ˈɪntɪɡrəl/', 'adjective', N'tính toàn bộ/toàn vẹn, cần cho tính toàn bộ/toàn vẹn; cần thiết, không thể thiếu', N'Music is an integral part of the school''s curriculum.', N'Âm nhạc là một phần không thể thiếu trong chương trình giảng dạy của trường.', 6, 3)
insert into lst_study_topic_vocab values(7, 'overlap', N'/ˌəʊvəˈlæp/', 'verb', N'sự gối lên nhau, sự chồng chéo', N'The floor was protected with overlapping sheets of newspaper.', N'Sàn nhà được bảo vệ bằng những tờ báo chồng lên nhau.', 6, 3)
insert into lst_study_topic_vocab values(8, 'retain', N'/rɪˈteɪn/', 'verb', N'giữ lại; tiếp tục có', N'He struggled to retain control of the situation.', N'Anh đấu tranh để giữ quyền kiểm soát tình hình.', 6, 3)
insert into lst_study_topic_vocab values(9, 'seep', N'/siːp/', 'verb', N'rỉ ra', N'Water seeped from a crack in the pipe.', N'Nước rỉ ra từ một vết nứt trên đường ống.', 6, 3)
insert into lst_study_topic_vocab values(10, 'structure', N'/ˈstrʌktʃə(r)/', 'noun', N'kết cấu, cấu trúc', N'Bees have a complex social structure.', N'Ong có một cấu trúc xã hội phức tạp .', 6, 3)
insert into lst_study_topic_vocab values(11, 'organic', N'/ɔːˈɡænɪk/', 'adjective', N'hữu cơ', N'Improve the soil by adding organic matter', N'Cải tạo đất bằng cách bổ sung chất hữu cơ .', 6, 3)
insert into lst_study_topic_vocab values(12, 'petrifaction', N'/ˌpet.rɪˈfæk.ʃən/', 'noun', N'sự hóa đá, sự sững sờ', N'They have undergone petrification.', N'Họ đã trải qua quá trình hóa đá.', 6, 3)
insert into lst_study_topic_vocab values(13, 'object', N'/ˈɒbdʒɪkt/', 'noun', N'phản đối, đồ vật', N'The scanner detected a metal object.', N'Máy quét phát hiện một vật thể kim loại.', 6, 3)
insert into lst_study_topic_vocab values(14, 'mineral', N'/ˈmɪnərəl/', 'noun', N'khoáng chất, khoáng vật', N'Low bone mineral density is linked with vitamin deficiency.', N'Mật độ khoáng xương thấp có liên quan đến tình trạng thiếu vitamin.', 6, 3)
insert into lst_study_topic_vocab values(15, 'version', N'/ˈvɜːʃn/', 'noun', N'phiên bản', N'The original/final version is vastly superior.', N'Phiên bản gốc/cuối cùng vượt trội hơn rất nhiều.', 6, 3)
insert into lst_study_topic_vocab values(16, 'mud', N'/mʌd/', 'noun', N'bùn, đất bùn nhão', N'The car wheels got stuck in the mud.', N'Bánh xe ô tô bị kẹt trong bùn.', 6, 3)
insert into lst_study_topic_vocab values(17, 'ancient', N'/ˈeɪnʃənt/', 'adjective', N'xưa, cổ', N'Archaeologists are excavating the ruined temples of this ancient civilization.', N'Các nhà khảo cổ đang khai quật những ngôi đền đổ nát của nền văn minh cổ đại này.', 6, 3)
insert into lst_study_topic_vocab values(18, 'scientific', N'/ˌsaɪənˈtɪfɪk/', 'adjective', N'thuộc về khoa học, (thuộc về) khoa học', N'He took a very scientific approach to management.', N'Ông đã có một cách tiếp cận rất khoa học để quản lý.', 6, 3)
insert into lst_study_topic_vocab values(19, 'layer', N'/ˈleɪər/', 'noun', N'tầng, lớp', N'Ducks have a thick layer of fat to keep them warm.', N'Vịt có lớp mỡ dày để giữ ấm.', 6, 3)
insert into lst_study_topic_vocab values(20, 'ash', N'/æʃ/', 'noun', N'tro, màu tro', N'She flicked ash out of the window carelessly.', N'Cô ấy hất tàn tro ra ngoài cửa sổ một cách bất cẩn.', 6, 3)

insert into lst_study_topic_vocab values(1, 'circulate', N'/ˈsɜːkjəleɪt/', 'verb', N'lưu hành, truyền', N'Rumours began to circulate about his financial problems.', N'Tin đồn bắt đầu lan truyền về các vấn đề tài chính của anh ấy.', 7, 3)
insert into lst_study_topic_vocab values(2, 'corrode', N'/kəˈrəʊd/', 'verb', N'ăn mòn', N'Acid corrodes metal.', N'Axit ăn mòn kim loại.', 7, 3)
insert into lst_study_topic_vocab values(3, 'derive', N'/dɪˈraɪv/', 'verb', N'xuất phát từ, bắt nguồn từ', N'Section 7 presents some user statistics derived from randomly logged requests.', N'Phần 7 trình bày một số thống kê người dùng bắt nguồn từ các yêu cầu được ghi ngẫu nhiên.', 7, 3)
insert into lst_study_topic_vocab values(4, 'detection', N'/dɪˈtekʃn/', 'noun', N'sự phát hiện', N'Last year the detection rate for car theft was just 13 per cent.', N'Năm ngoái, tỷ lệ phát hiện trộm xe hơi chỉ là 13%.', 7, 3)
insert into lst_study_topic_vocab values(5, 'expeditious', N'/ˌekspəˈdɪʃəs/', 'adjective', N'hiệu quả', N'It is the most expeditious method of dealing with the situation.', N'Đó là phương pháp hiệu quả nhất để giải quyết tình huống', 7, 3)
insert into lst_study_topic_vocab values(6, 'implement', N'/ˈɪmplɪment/', 'verb', N'triển khai, thực hiện', N'A new work programme for young people will be implemented.', N'Một chương trình làm việc mới cho những người trẻ tuổi sẽ được thực hiện.', 7, 3)
insert into lst_study_topic_vocab values(7, 'innovative', N'/ˈɪnəveɪtɪv/', 'adjective', N'sáng tạo, đổi mới', N'There will be a prize for the most innovative design.', N'Sẽ có một giải thưởng cho thiết kế sáng tạo nhất.', 7, 3)
insert into lst_study_topic_vocab values(8, 'installation', N'/ˌɪnstəˈleɪʃn/', 'noun', N'sự cài đặt, (n) sự lắp đặt', N'Installation of the new system will take several days.', N'Việc cài đặt hệ thống mới sẽ mất vài ngày.', 7, 3)
insert into lst_study_topic_vocab values(9, 'maintenance', N'/ˈmeɪntənəns/', 'noun', N'sự giữ gìn, duy trì, bảo quản', N'The school pays for heating and the maintenance of the buildings.', N'Nhà trường trả tiền sưởi ấm và bảo trì các tòa nhà.', 7, 3)
insert into lst_study_topic_vocab values(10, 'simulate', N'/ˈsɪmjuleɪt/', 'verb', N'bắt chước, mô phỏng', N'Computer software can be used to simulate conditions on the seabed.', N'Phần mềm máy tính có thể được sử dụng để mô phỏng các điều kiện dưới đáy biển.', 7, 3)
insert into lst_study_topic_vocab values(11, 'dependence', N'/dɪˈpendəns/', 'noun', N'sự phụ thuộc, sự lệ thuộc', N'Our relationship was based on mutual dependence.', N'Mối quan hệ của chúng tôi dựa trên sự phụ thuộc lẫn nhau.', 7, 3)
insert into lst_study_topic_vocab values(12, 'support', N'/səˈpɔːt/', 'verb', N'ủng hộ, hỗ trợ', N'Efforts to reduce waste are strongly supported by environmental groups.', N'Những nỗ lực để giảm chất thải được hỗ trợ mạnh mẽ bởi các nhóm môi trường.', 7, 3)
insert into lst_study_topic_vocab values(13, 'vigilance', N'/ˈvɪdʒɪləns/', 'noun', N'sự cảnh giác', N'She stressed the need for constant vigilance.', N'Cô nhấn mạnh sự cần thiết của sự cảnh giác liên tục.', 7, 3)
insert into lst_study_topic_vocab values(14, 'self-appointed', N'/ˌself əˈpɔɪntɪd/', 'adjective', N'tự phong, tự bổ nhiệm', N'The newspaper has become the self-appointed guardian of public morals.', N'Tờ báo đã tự bổ nhiệm mình trở thành người bảo vệ đạo đức công cộng .', 7, 3)
insert into lst_study_topic_vocab values(15, 'freelance', N'/ˈfriːlɑːns/', 'adjective', N'người làm nghề tự do, người hành nghề tự do', N'Most of the journalists I know are/work freelance.', N'Hầu hết các nhà báo mà tôi biết đều làm việc tự do.', 7, 3)
insert into lst_study_topic_vocab values(16, 'consultant', N'/kənˈsʌltənt/', 'noun', N'cố vấn, chuyên viên tư vấn', N'She is clearly being coached by image consultants.', N'Cô ấy rõ ràng đang được huấn luyện bởi các chuyên gia tư vấn hình ảnh.', 7, 3)
insert into lst_study_topic_vocab values(17, 'propose', N'/prəˈpəʊz/', 'verb', N'cầu hôn/đề xuất', N'The Board of Directors is proposing an amendment to Article I.', N'Hội đồng quản trị đang đề xuất sửa đổi Điều I.', 7, 3)
insert into lst_study_topic_vocab values(18, 'unique', N'/juˈniːk/', 'adjective', N'độc nhất vô nhị, đặc biệt', N'Each item has a unique 6-digit code.', N'Mỗi mặt hàng có một mã gồm 6 chữ số duy nhất.', 7, 3)
insert into lst_study_topic_vocab values(19, 'inventory', N'/ˈɪnvəntri/', 'noun', N'(sự/bản) kiểm kê, tóm tắt; hàng hóa tồn kho, hàng trong kho', N'The inventory will be disposed of over the next twelve weeks.', N'Hàng tồn kho sẽ được xử lý trong vòng mười hai tuần tới.', 7, 3)
insert into lst_study_topic_vocab values(20, 'personnel', N'/ˌpɜːsəˈnel/', 'noun', N'cán bộ, nhân viên', N'There is a severe shortage of skilled personnel.', N'Nhân lực có tay nghề cao đang thiếu trầm trọng. ', 7, 3)


insert into lst_study_topic_vocab values(1, 'combustion', N'/kəmˈbʌstʃən/', 'noun', N'sự đốt cháy', N'Poisonous gases are produced during fossil fuel combustion.', N'Khí độc được tạo ra trong quá trình đốt cháy nhiên liệu hóa thạch.', 8, 3)
insert into lst_study_topic_vocab values(2, 'component', N'/kəmˈpəʊnənt/', 'noun', N'thành phần, bộ phận', N'Nitrogen is the main component of air.', N'Nitơ là thành phần chính của không khí.', 8, 3)
insert into lst_study_topic_vocab values(3, 'convey', N'/kənˈveɪ/', 'verb', N'chuyển tải, thể hiện (ý tưởng, cảm xúc đến ai)', N'His poetry conveys a great sense of religious devotion.', N'Thơ của ông truyền đạt một cảm giác tuyệt vời của sự tôn sùng tôn giáo .', 8, 3)
insert into lst_study_topic_vocab values(4, 'discrete', N'/dɪˈskriːt/', 'adjective', N'riêng biệt', N'The organisms can be divided into discrete categories.', N'Các sinh vật có thể được chia thành các loại riêng biệt.', 8, 3)
insert into lst_study_topic_vocab values(5, 'nuclear', N'/ˈnjuːkliə(r)/', 'adjective', N'hạt nhân, đầy đủ', N'China and India only produce a very small percentage of their electricity from nuclear facilities.', N'Trung Quốc và Ấn Độ chỉ sản xuất một tỷ lệ rất nhỏ điện năng của họ từ các cơ sở hạt nhân.', 8, 3)
insert into lst_study_topic_vocab values(6, 'permeate', N'/ˈpɜːmieɪt/', 'verb', N'lan ra, tràn ngập', N'The air was permeated with the odour of burning rubber.', N'Không khí tràn ngập mùi cao su cháy.', 8, 3)
insert into lst_study_topic_vocab values(7, 'rotate', N'/rəʊˈteɪt/', 'verb', N'làm quay, làm xoay quanh', N'Stay well away from the helicopter when its blades start to rotate.', N'Tránh xa máy bay trực thăng khi cánh quạt của nó bắt đầu quay.', 8, 3)
insert into lst_study_topic_vocab values(8, 'solar', N'/ˈsəʊlə/', 'adjective', N'thuộc mặt trời, năng lượng mặt trời', N'They are searching for intelligent life forms in other solar systems.', N'Họ đang tìm kiếm các dạng sống thông minh trong các hệ mặt trời khác.', 8, 3)
insert into lst_study_topic_vocab values(9, 'source', N'/sɔːs/', 'noun', N'nguồn, nguồn gốc', N'These fish are widely used as a food source.', N'Những con cá này được sử dụng rộng rãi như một nguồn thực phẩm .', 8, 3)
insert into lst_study_topic_vocab values(10, 'trigger', N'/ˈtrɪɡə(r)/', 'verb', N'cò súng, gây ra', N'Nuts can trigger off a violent allergic reaction.', N'Các loại hạt có thể gây ra phản ứng dị ứng dữ dội.', 8, 3)
insert into lst_study_topic_vocab values(11, 'electricity', N'/ɪˌlekˈtrɪsəti/', 'noun', N'điện thắp sáng, điện lực', N'The wind farm will generate enough electricity for some 30 000 homes.', N'Trang trại gió sẽ tạo ra đủ điện cho khoảng 30 000 hộ gia đình.', 8, 3)
insert into lst_study_topic_vocab values(12, 'steam', N'/stiːm/', 'noun', N'hơi nước, hấp', N'Steam rose from the boiling kettle.', N'Hơi nước bốc lên từ ấm đun sôi.', 8, 3)
insert into lst_study_topic_vocab values(13, 'turbine', N'/ˈtɜːbaɪn/', 'noun', N'tua-bin', N'Gas turbines can be used to generate electricity.', N'Tua bin khí có thể được sử dụng để tạo ra điện.', 8, 3)
insert into lst_study_topic_vocab values(14, 'shaft', N'/ʃɑːft/', 'noun', N'hầm, lò, trục', N'The clubs are fitted with graphite shafts.', N'Các câu lạc bộ được trang bị trục than chì.', 8, 3)
insert into lst_study_topic_vocab values(15, 'generator', N'/ˈdʒenəreɪtə(r)/', 'noun', N'máy phát điện', N'The wind generator delivers 120 watts in a strong breeze.', N'Máy phát điện gió cung cấp 120 watt trong một làn gió mạnh.', 8, 3)
insert into lst_study_topic_vocab values(16, 'fission', N'/ˈfɪʃn/', 'noun', N'sự phân hạch', N'The fission of the cell could be inhibited with certain chemicals.', N'Sự phân hạch của tế bào có thể bị ức chế bởi một số hóa chất .', 8, 3)
insert into lst_study_topic_vocab values(17, 'atom', N'/ˈætəm/', 'noun', N'nguyên tử', N'Two atoms of hydrogen combine with one atom of oxygen to form a molecule of water.', N'Hai nguyên tử hydro kết hợp với một nguyên tử oxy để tạo thành một phân tử nước.', 8, 3)
insert into lst_study_topic_vocab values(18, 'harness', N'/ˈhɑːnɪs/', 'noun', N'điều khiển, sử dụng lực hay khả năng của cái gì để tạo ra sức mạnh hay đạt được mục đích', N'The sight of horses in harness hauling timber was common a hundred years ago.', N'Hình ảnh những con ngựa kéo gỗ đã phổ biến cách đây hàng trăm năm.', 8, 3)
insert into lst_study_topic_vocab values(19, 'aware', N'/əˈweə(r)/', 'adjective', N'biết, nhận thấy, nhận thức thấy', N'They suddenly became aware of people looking at them.', N'Họ chợt nhận ra có người đang nhìn mình.', 8, 3)
insert into lst_study_topic_vocab values(20, 'heat', N'/hiːt/', 'noun', N'hơi nóng, nhiệt', N'He could feel the heat of the sun on his back.', N'Anh có thể cảm thấy sức nóng của mặt trời trên lưng mình.', 8, 3)

insert into lst_study_topic_vocab values(1, 'anomaly', N'/əˈnɒməli/', 'noun', N'sự không bình thường, dị thường', N'There are areas of anomaly in the report.', N'Có những khu vực bất thường trong báo cáo.', 9, 3)
insert into lst_study_topic_vocab values(2, 'memory', N'/ˈmeməri/', 'noun', N'kỷ niệm, tri nhớ', N'People have short memories.', N'Mọi người có trí nhớ ngắn.', 9, 3)
insert into lst_study_topic_vocab values(3, 'degrade', N'/dɪˈɡreɪd/', 'verb', N'giảm dần', N'Important natural habitats have been degraded by development.', N'Các môi trường sống tự nhiên quan trọng đã bị suy thoái do quá trình phát triển.', 9, 3)
insert into lst_study_topic_vocab values(4, 'gap', N'/ɡæp/', 'noun', N'khoảng trống, sự thiếu sót', N'Extra funding is needed to plug the gap.', N'Cần có thêm kinh phí để thu hẹp khoảng cách.', 9, 3)
insert into lst_study_topic_vocab values(5, 'indisputable', N'/ˌɪndɪˈspjuːtəbl/', 'adjective', N'không thể phủ nhận', N'It is indisputable that the crime rate has been rising.', N'Không thể chối cãi rằng tỷ lệ tội phạm đang gia tăng.', 9, 3)
insert into lst_study_topic_vocab values(6, 'intervene', N'/ˌɪntəˈviːn/', 'verb', N'xen vào, can vào', N'They would not intervene against the rebels themselves.', N'Họ sẽ không can thiệp chống lại chính những kẻ nổi loạn.', 9, 3)
insert into lst_study_topic_vocab values(7, 'intuitively', N'/ɪnˈtjuːɪtɪvli/', 'adverb', N'bằng trực giác', N'Intuitively, she knew that he was lying.', N'Bằng trực giác, cô biết rằng anh đang nói dối.', 9, 3)
insert into lst_study_topic_vocab values(8, 'recession', N'/rɪˈseʃn/', 'noun', N'sự suy thoái (kinh tế), sự suy giảm', N'These industries have been hard hit by recession.', N'Những ngành công nghiệp này đã bị ảnh hưởng nặng nề bởi sự suy thoái.', 9, 3)
insert into lst_study_topic_vocab values(9, 'retrieval', N'/rɪˈtriːvl/', 'noun', N'sự truy lục', N'The ship was buried, beyond retrieval, at the bottom of the sea.', N'Con tàu đã bị chôn vùi, không thể trục vớt được, dưới đáy biển.', 9, 3)
insert into lst_study_topic_vocab values(10, 'function', N'/ˈfʌŋkʃn/', 'noun', N'chức năng, nhiệm vụ', N'The club serves a useful function as a meeting place.', N'Câu lạc bộ phục vụ một chức năng hữu ích như một nơi gặp gỡ.', 9, 3)
insert into lst_study_topic_vocab values(11, 'perception', N'/pəˈsepʃn/', 'noun', N'cách nhìn nhận, quan niệm về việc gì', N'They have little perception of how ordinary people live their lives.', N'Họ có ít nhận thức về cách những người bình thường sống cuộc sống của họ.', 9, 3)
insert into lst_study_topic_vocab values(12, 'imperfect', N'/ɪmˈpɜːfɪkt/', 'adjective', N'không hoàn hảo', N'All our sale items are slightly imperfect.', N'Tất cả các mặt hàng bán của chúng tôi hơi không hoàn hảo.', 9, 3)
insert into lst_study_topic_vocab values(13, 'recollection', N'/ˌrekəˈlekʃn/', 'noun', N'sự hồi tưởng', N' I have no recollection of meeting her before.', N'Tôi không nhớ đã gặp cô ấy trước đây.', 9, 3)
insert into lst_study_topic_vocab values(14, 'storage', N'/ˈstɔːrɪdʒ/', 'noun', N'sự cất giữ, sự dự trữ, sự lưu giữ', N'We need more storage now.', N'Chúng tôi cần thêm dung lượng lưu trữ ngay bây giờ.', 9, 3)
insert into lst_study_topic_vocab values(15, 'compensate', N'/ˈkɒmpenseɪt/', 'verb', N'bù, đền bù, bồi thường', N'Nothing can compensate for the loss of a loved one.', N'Không có gì có thể bù đắp cho sự mất mát của một người thân yêu.', 9, 3)
insert into lst_study_topic_vocab values(16, 'locate', N'/ləʊˈkeɪt/', 'verb', N'định vị; xác định vị trí của', N'The mechanic located the fault immediately.', N'Các thợ máy xác định lỗi ngay lập tức.', 9, 3)
insert into lst_study_topic_vocab values(17, 'distortion', N'/dɪˈstɔːʃn/', 'noun', N'sự rối loạn', N'Distortion of sound is a common problem with cheap amps.', N'Biến dạng âm thanh là một vấn đề phổ biến với amps giá rẻ.', 9, 3)
insert into lst_study_topic_vocab values(18, 'acquisition', N'/ˌækwɪˈzɪʃn/', 'noun', N'sự giành được, thu được, đạt được (kiến thức, kỹ năng)', N'His latest acquisition is a racehorse.', N'Mua lại mới nhất của anh ấy là một con ngựa đua.', 9, 3)
insert into lst_study_topic_vocab values(19, 'mind', N'/maɪnd/', 'noun', N'trí óc/phiền', N'There were all kinds of thoughts running through my mind.', N'Có tất cả các loại suy nghĩ chạy qua tâm trí của tôi.', 9, 3)
insert into lst_study_topic_vocab values(20, 'occurrence', N'/əˈkʌrəns/', 'noun', N'sự việc, sự kiện, sự cố', N'Vandalism used to be a rare occurrence here.', N'Phá hoại từng là một điều hiếm khi xảy ra ở đây.', 9, 3)

insert into lst_study_topic_vocab values(1, 'agnosticism', N'/æɡˈnɒstɪsɪzəm/', 'noun', N'thuyết Bất Khả Tri', N'According to census figures, men significantly outnumber women in claiming agnosticism.', N'Theo số liệu điều tra dân số , đàn ông nhiều hơn đáng kể so với phụ nữ trong việc tuyên bố thuyết Bất Khả Tri.', 10, 3)
insert into lst_study_topic_vocab values(2, 'animism', N'/ˈænɪmɪzəm/', 'noun', N'thuyết Vạn Vật Hữu Linh', N'Animism is a religious and ontological perspective common to many indigenous cultures across the globe.', N'Thuyết Vạn Vật Hữu Linh là một quan điểm tôn giáo và bản thể học phổ biến đối với nhiều nền văn hóa bản địa trên toàn cầu.', 10, 3)
insert into lst_study_topic_vocab values(3, 'atheism', N'/ˈeɪθiɪzəm/', 'noun', N'thuyết Vô Thần', N'Atheism as we know it did not exist until modern times.', N'Chủ nghĩa vô thần như chúng ta biết đã không tồn tại cho đến thời hiện đại.', 10, 3)
insert into lst_study_topic_vocab values(4, 'be inclined to', N'/bi ɪnˈklaɪnd tə/', 'verb', N'thiên về xu hướng muốn', N'Tom is inclined to be lazy.', N'Tom có ​​khuynh hướng lười biếng.', 10, 3)
insert into lst_study_topic_vocab values(5, 'contemplation', N'/ˌkɒntəmˈpleɪʃn/', 'noun', N'sự suy ngẫm', N'He sat there deep in contemplation.', N'Anh ngồi đó trầm ngâm suy nghĩ.', 10, 3)
insert into lst_study_topic_vocab values(6, 'deify', N'/ˈdeɪɪfaɪ/', 'verb', N'phong Thánh', N'The Romans used to deify their emperors', N'Người La Mã từng tôn thờ các hoàng đế của họ.', 10, 3)
insert into lst_study_topic_vocab values(7, 'ecclesiastical', N'//', 'adjective', N'(thuộc) giáo hội', N'An ecclesiastical office is the office at a church, and a nun''s habit is ecclesiastical dress.', N'Văn phòng giáo hội là văn phòng tại nhà thờ, và trang phục của nữ tu là trang phục của giáo hội.', 10, 3)
insert into lst_study_topic_vocab values(8, 'exalt', N'/ɪɡˈzɔːlt/', 'verb', N'đưa lên địa vị, cấp bậc cao hơn', N'His son was exalted to a high position in the government through family connections.', N'Con trai ông đã được tôn lên một vị trí cao trong chính phủ thông qua các mối quan hệ gia đình.', 10, 3)
insert into lst_study_topic_vocab values(9, 'pious', N'/ˈpaɪəs/', 'adjective', N'ngoan đạo, sùng đạo', N'He dismissed his critics as pious do-gooders.', N'Ông coi những người chỉ trích mình là những người làm điều tốt ngoan đạo.', 10, 3)
insert into lst_study_topic_vocab values(10, 'prominent', N'/ˈprɒmɪnənt/', 'adjective', N'quan trọng, nổi tiếng', N'The played a prominent part in the campaign.', N'Anh ấy đã đóng một vai trò nổi bật trong chiến dịch.', 10, 3)
insert into lst_study_topic_vocab values(11, 'power', N'/ˈpaʊə(r)/', 'noun', N'quyền lực, sức mạnh', N'Religion is losing its power to shape our behaviour.', N'Tôn giáo đang mất đi sức mạnh định hình hành vi của chúng ta.', 10, 3)
insert into lst_study_topic_vocab values(12, 'religion', N'/rɪˈlɪdʒən/', 'noun', N'tôn giáo', N'He believed in God but had no interest in organized religion.', N'Ông tin vào Chúa nhưng không quan tâm đến tôn giáo có tổ chức.', 10, 3)
insert into lst_study_topic_vocab values(13, 'tenacity', N'/təˈnæsəti/', 'noun', N'việc sùng kính', N'They competed with skill and tenacity.', N'Họ đã thi đấu với kỹ năng và sự bền bỉ.', 10, 3)
insert into lst_study_topic_vocab values(14, 'orthodox', N'/ˈɔːθədɒks/', 'adjective', N'thông thường; đi theo những quan điểm thường được chấp nhận', N'He is very orthodox in his views.', N'Anh ấy rất chính thống trong quan điểm của mình.', 10, 3)
insert into lst_study_topic_vocab values(15, 'patriarch', N'/ˈpeɪtriɑːk/', 'noun', N'Vị Thượng Phụ', N'A patriarch is a male leader.', N'Một tộc trưởng là một nhà lãnh đạo nam.', 10, 3)
insert into lst_study_topic_vocab values(16, 'pilgrimage', N'/ˈpɪlɡrɪmɪdʒ/', 'noun', N'đi hành hương', N'His grave has become a place of pilgrimage.', N'Ngôi mộ của ông đã trở thành một nơi hành hương .', 10, 3)
insert into lst_study_topic_vocab values(17, 'broaden', N'/ˈbrɔːdn/', 'verb', N'mở rộng, nới rộng', N'The party needs to broaden its appeal to voters.', N'Đảng cần mở rộng sức hấp dẫn của mình đối với cử tri.', 10, 3)
insert into lst_study_topic_vocab values(18, 'coexist', N'/ˌkəʊɪɡˈzɪst/', 'verb', N'sống chung, cùng tồn tại', N'English speakers now coexist peacefully with their Spanish-speaking neighbours.', N'Những người nói tiếng Anh giờ đây cùng chung sống hòa bình với những người hàng xóm nói tiếng Tây Ban Nha.', 10, 3)
insert into lst_study_topic_vocab values(19, 'christianity', N'/ˌkrɪstiˈænəti/', 'noun', N'đạo Thiên Chúa, đạo Cơ đốc', N'Christianity spread rapidly in the first century.', N'Kitô giáo lan rộng nhanh chóng trong thế kỷ thứ nhất.', 10, 3)
insert into lst_study_topic_vocab values(20, 'judaism', N'/ˈdʒuːdeɪɪzəm/', 'noun', N'đạo Do Thái', N'He converted to Judaism.', N'Ông đã chuyển đổi sang Do Thái giáo.', 10, 3)
-------