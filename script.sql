CREATE TABLE questionario(
	apelido VARCHAR(100),
	nome VARCHAR(250),
	descricao VARCHAR(1000) NOT NULL,
	
	CONSTRAINT pk_questionario PRIMARY KEY (apelido)
);

CREATE TABLE pergunta(
	idPerg SERIAL,
	questOrigPerg VARCHAR(100),
	conteudoPerg VARCHAR(800) NOT NULL,
	
	CONSTRAINT pk_pergunta PRIMARY KEY (idPerg),
	CONSTRAINT fk_pergunta FOREIGN KEY (questOrigPerg) 
			    REFERENCES questionario (apelido) ON DELETE CASCADE
);

CREATE TABLE direcionamento(
	idDirec SERIAL,
	--questOrigDirec VARCHAR(250),
	conteudoDirec VARCHAR(800) NOT NULL,

	CONSTRAINT pk_direcionamento PRIMARY KEY (idDirec)
	--CONSTRAINT fk_direcionamento FOREIGN KEY (questOrigDirec)
			   --REFERENCES questionario (apelido) ON DELETE SET NULL
);

CREATE TABLE atendente(
	nomeAtendente VARCHAR(150) NOT NULL,
	emailAtendente VARCHAR (100),
	linkAgenda VARCHAR(200) NOT NULL,
	
	CONSTRAINT pk_atendente PRIMARY KEY (emailAtendente)
);

CREATE TABLE usuario(
	idUsuario VARCHAR(50),
	nomeUsuario VARCHAR(150) NOT NULL,
	
	CONSTRAINT pk_usuario PRIMARY KEY (idUsuario)
);

CREATE TABLE instituto(
	siglaInstituto VARCHAR(6),
	nomeInstituto VARCHAR(100) NOT NULL,
	atendenteResp VARCHAR(100),
	
	CONSTRAINT pk_instituto PRIMARY KEY (siglaInstituto),
	CONSTRAINT fk_instituto FOREIGN KEY (atendenteResp)
			   REFERENCES atendente (emailAtendente) ON DELETE SET NULL	
);



INSERT INTO questionario VALUES ('SRQ-20', 'Self Report Questionnaire', 'Nas próximas próximas perguntas, você realizará uma autoavaliação a respeito da sua saúde em geral. Serão 24 afirmativas, e você deve selecionar sim ou não para cada afirmativa. Não existe resposta certa ou errada, por isso pedimos que você responda da forma que você julgar melhor. Caso tenha alguma dúvida, você pode nos mandar uma mensagem pelo XXX.');
								  
INSERT INTO questionario VALUES ('Columbia', 'Avaliação do Risco de Suicídio de Columbia', 'Nessa escala, será avaliado o risco de suicídio através de algumas perguntas. Essa escala foi criada por pesquisadores de diversas universidades (Universidade de Columbia; Universidade da Pensilvânia; Universidade de Pittsburgh e Universidade de Nova Iorque) e avalia comportamentos específicos que podem ser indicativos da intenções de uma pessoa em cometer suicídio. É importante ressaltar que os resultados apresentados são referentes a um período específico de sua vida, e que também podem mudar de acordo com as condições ambientais e temporais. É importante destacar que este resultado não visa definir você enquanto “suicida”, mas, sim, mostrar a necessidade de você procurar ajuda para enfrentar as dificuldades que está passando, no momento. Por isso pedimos que você seja o mais sincero/a possível nas respostas, para que você saiba se é importante buscar ajuda, ou de familiares e amigos, ou de uma equipe de saúde especializada.');




INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Você tem dores de cabeça frequentes?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem falta de apetite?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Dorme mal?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Assusta-se com facilidade?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem tremores nas mãos?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Sente-se nervoso(a), tenso(a) ou preocupado(a)?');

INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem má digestão?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem dificuldades de pensar com clareza?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem se sentido triste ultimamente?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem chorado mais do que costume?');
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Encontra dificuldades para realizar com satisfação suas atividades diárias?');	
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem dificuldades para tomar decisões?');				
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'É incapaz de desempenhar um papel útil em sua vida?');				
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem perdido o interesse pelas coisas?');				
			
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem dificuldades no serviço (seu trabalho é penoso, lhe causa sofrimento)?');			
		
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Você se sente uma pessoa inútil, sem préstimo?');			
		
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem tido ideia de acabar com a vida?');			
		
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Sente-se cansado(a) o tempo todo?');			
		
INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Você se cansa com facilidade?');			

INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Tem sensações desagradáveis no estomago?');

INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('SRQ-20', 'Fim do questionário');
			
		
		
INSERT INTO pergunta (questOrigPerg, conteudoPerg)
			VALUES ('Columbia', 'Você desejou estar morto(a) ou desejou poder dormir e nunca mais acordar?');
					
INSERT INTO pergunta (questOrigPerg, conteudoPerg)
			VALUES ('Columbia', 'Você já pensou realmente em se matar?');
					 
INSERT INTO pergunta (questOrigPerg, conteudoPerg)
			VALUES ('Columbia', 'Você tem pensado em como poderia fazer isso?');
					
INSERT INTO pergunta (questOrigPerg, conteudoPerg)
			VALUES ('Columbia', 'Você teve esses pensamentos e teve alguma intenção de colocá-los em prática?');
					
INSERT INTO pergunta (questOrigPerg, conteudoPerg)
			VALUES ('Columbia', 'Você já começou a elaborar ou já elaborou os detalhes de como se matar? Você pretende executar esse plano?');
					
INSERT INTO pergunta (questOrigPerg, conteudoPerg)
			VALUES ('Columbia', 'Você já fez alguma coisa, começou a fazer algo ou planejou fazer alguma coisa para acabar com sua vida?');	

INSERT INTO pergunta (questOrigPerg, conteudoPerg) 
	        VALUES ('Columbia', 'Fim do questionário');

					
					
INSERT INTO direcionamento (conteudoDirec) VALUES ('GAPSI');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('Apoia USP');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('UBS');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('USF');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('Matriciamento');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('CAPS (II ou AD)');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('UPA');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('Santa Casa');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('Transporte');	

INSERT INTO direcionamento (conteudoDirec) VALUES ('SAMU');	



INSERT INTO atendente VALUES ('atendenteICMC', 'icmc@usp.br', 'https://calendar.google.com/calendar/embed?src=usp.br_8gf4aqtrm2hdehm8aq3u10e548%40group.calendar.google.com&ctz=America%2FSao_Paulo');

INSERT INTO atendente VALUES ('atendenteIQSC', 'iqsc@usp.br', 'https://calendar.google.com/calendar/embed?src=usp.br_6fn9rhdlbg7ega7omtec6ih6h8%40group.calendar.google.com&ctz=America%2FSao_Paulo');

INSERT INTO atendente VALUES ('atendenteEESC', 'eesc@usp.br', 'https://calendar.google.com/calendar/embed?src=usp.br_4u3u7sld0ra4qm7t3i229gejdg%40group.calendar.google.com&ctz=America%2FSao_Paulo');

INSERT INTO atendente VALUES ('atendenteIAU', 'iau@usp.br', 'https://calendar.google.com/calendar/embed?src=usp.br_1delqhqvni7fjffap2oj30emg8%40group.calendar.google.com&ctz=America%2FSao_Paulo');

INSERT INTO atendente VALUES ('atendenteOutros', 'outros@usp.br', 'https://calendar.google.com/calendar/embed?src=usp.br_vdr9jsc48snetq70f6lgdb8tpk%40group.calendar.google.com&ctz=America%2FSao_Paulo');




-- CAMPUS SÃO CARLOS
INSERT INTO instituto VALUES ('ICMC', 'Instituto de Ciências Matemáticas e de Computação', 'icmc@usp.br');

INSERT INTO instituto VALUES ('IQSC', 'Instituto de Química de São Carlos', 'iqsc@usp.br');

INSERT INTO instituto VALUES ('IFSC', 'Instituto de Física de São Carlos', 'outros@usp.br');

INSERT INTO instituto VALUES ('EESC', 'Escola de Engenharia de São Carlos', 'eesc@usp.br');

INSERT INTO instituto VALUES ('IAU', 'Instituto de Arquitetura e Urbanismo', 'iau@usp.br');


-- CAMPUS SÃO PAULO
INSERT INTO instituto VALUES ('EACH', 'Escola de Artes, Ciências e Humanidades', 'outros@usp.br');

INSERT INTO instituto VALUES ('ECA', 'Escola de Comunicações e Artes', 'outros@usp.br');

INSERT INTO instituto VALUES ('EEFE', 'Escola de Educação Física e Esporte', 'outros@usp.br');

INSERT INTO instituto VALUES ('EE', 'Escola de Enfermagem', 'outros@usp.br');

INSERT INTO instituto VALUES ('Poli', 'Escola Politécnica', 'outros@usp.br');

INSERT INTO instituto VALUES ('FAU', 'Faculdade de Arquitetura e Urbanismo', 'outros@usp.br');

INSERT INTO instituto VALUES ('FCF', 'Faculdade de Ciências Farmacêuticas', 'outros@usp.br');

INSERT INTO instituto VALUES ('FD', 'Faculdade de Direito', 'outros@usp.br');

INSERT INTO instituto VALUES ('FEA', 'Faculdade de Economia, Administração e Contabilidade', 'outros@usp.br');

INSERT INTO instituto VALUES ('FE', 'Faculdade de Educação', 'outros@usp.br');

INSERT INTO instituto VALUES ('FFLCH', 'Faculdade de Filosofia, Letras e Ciências Humanas', 'outros@usp.br');

INSERT INTO instituto VALUES ('FM', 'Faculdade de Medicina', 'outros@usp.br');

INSERT INTO instituto VALUES ('FMVZ', 'Faculdade de Medicina Veterinária e Zootecnia', 'outros@usp.br');

INSERT INTO instituto VALUES ('FO', 'Faculdade de Odontologia', 'outros@usp.br');

INSERT INTO instituto VALUES ('FSP', 'Faculdade de Saúde Pública', 'outros@usp.br');

INSERT INTO instituto VALUES ('IAG', 'Instituto de Astronomia, Geofísica e Ciências Atmosféricas', 'outros@usp.br');

INSERT INTO instituto VALUES ('IB', 'Instituto de Biociências', 'outros@usp.br');

INSERT INTO instituto VALUES ('ICB', 'Instituto de Ciências Biomédicas', 'outros@usp.br');

INSERT INTO instituto VALUES ('IEE', 'Instituto de Energia e Ambiente', 'outros@usp.br');

INSERT INTO instituto VALUES ('IEA', 'Instituto de Estudos Avançados', 'outros@usp.br');

INSERT INTO instituto VALUES ('IEB', 'Instituto de Estudos Brasileiros', 'outros@usp.br');

INSERT INTO instituto VALUES ('IF', 'Instituto de Física', 'outros@usp.br');

INSERT INTO instituto VALUES ('IGc', 'Instituto de Geociências', 'outros@usp.br');

INSERT INTO instituto VALUES ('IME', 'Instituto de Matemática e Estatística', 'outros@usp.br');

INSERT INTO instituto VALUES ('IMT', 'Instituto de Medicina Tropical de São Paulo', 'outros@usp.br');

INSERT INTO instituto VALUES ('IP', 'Instituto de Psicologia', 'outros@usp.br');

INSERT INTO instituto VALUES ('IQ', 'Instituto de Química', 'outros@usp.br');

INSERT INTO instituto VALUES ('IRI', 'Instituto de Relações Internacionais', 'outros@usp.br');

INSERT INTO instituto VALUES ('IO', 'Instituto Oceanográfico', 'outros@usp.br');


-- CAMPUS BAURU
INSERT INTO instituto VALUES ('FOB', 'Faculdade de Odontologia de Bauru', 'outros@usp.br');


-- CAMPUS LORENA
INSERT INTO instituto VALUES ('EEL', 'Escola de Engenharia de Lorena', 'outros@usp.br');


-- CAMPUS PIRACICABA
INSERT INTO instituto VALUES ('CENA', 'Centro de Energia Nuclear na Agricultura', 'outros@usp.br');

INSERT INTO instituto VALUES ('ESALQ', 'Escola Superior de Agricultura "Luiz de Queiroz"', 'outros@usp.br');


-- CAMPUS PIRASSUNUNGA
INSERT INTO instituto VALUES ('FZEA', 'Faculdade de Zootecnia e Engenharia de Alimentos', 'outros@usp.br');


-- CAMPUS RIBEIRÃO PRETO
INSERT INTO instituto VALUES ('EEFERP', 'Escola de Educação Física e Esporte de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('EERP', 'Escola de Enfermagem de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('FCFRP', 'Faculdade de Ciências Farmacêuticas de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('FDRP', 'Faculdade de Direto de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('FEARP', 'Faculdade de Economia, Administração e Contabilidade de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('FFCLRP', 'Faculdade de Filosofia, Ciências e Letras de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('FMRP', 'Faculdade de Medicina de Ribeirão Preto', 'outros@usp.br');

INSERT INTO instituto VALUES ('FORP', 'Faculdade de Odontologia de Ribeirão Preto', 'outros@usp.br');


-- CAMPUS SANTOS
INSERT INTO instituto VALUES ('PMI', 'Departamento de Engenharia de Minas e Petróleo', 'outros@usp.br');



INSERT INTO usuario VALUES ('10692224', 'Giovana Daniele da Silva');

INSERT INTO usuario VALUES ('10692054', 'João Pedro Almeida Santos Secundino');


