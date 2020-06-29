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

CREATE TABLE instituto(
	siglaInstituto VARCHAR(10),
	nomeInstituto VARCHAR(100) NOT NULL,
	atendenteResp VARCHAR(100),
	
	CONSTRAINT pk_instituto PRIMARY KEY (siglaInstituto),
	CONSTRAINT fk_instituto FOREIGN KEY (atendenteResp)
			   REFERENCES atendente (emailAtendente) ON DELETE SET NULL	
);

CREATE TABLE token(
	idToken SERIAL,
	access_token VARCHAR(256) NOT NULL,
	refresh_token VARCHAR(256) NOT NULL,
	scope VARCHAR(64) NOT NULL,
	token_type CHAR(6) NOT NULL,
	expiry_date VARCHAR(16) NOT NULL,
	institutoToken VARCHAR(6) NOT NULL,

	CONSTRAINT pk_token PRIMARY KEY (idToken),
	CONSTRAINT fk_token FOREIGN KEY (institutoToken)
			   REFERENCES instituto (siglaInstituto) ON DELETE CASCADE
);


CREATE TABLE administrador(
	emailAdministrador VARCHAR(100) NOT NULL,

	CONSTRAINT pk_administrador PRIMARY KEY (emailAdministrador)
);

CREATE TABLE usuario(
	idUsuario VARCHAR(50),
	nuspUsuario VARCHAR(12) UNIQUE NOT NULL,
	nomeUsuario VARCHAR(150) NOT NULL,
	institutoUsuario VARCHAR(100) NOT NULL,
	emailUsuario VARCHAR(100) NOT NULL,
	
	CONSTRAINT pk_usuario PRIMARY KEY (idUsuario),
	CONSTRAINT fk_usuario FOREIGN KEY (institutoUsuario)
			   REFERENCES instituto (siglaInstituto) ON DELETE CASCADE
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
	        VALUES ('SRQ-20', 'Tem dificuldades no serviço (seu trabalho é penoso, lhe causa sofrimento?)');			
		
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

-- OUTROS
INSERT INTO instituto VALUES ('PUSP', 'Prefeitura do Campus USP', 'outros@usp.br');

INSERT INTO instituto VALUES ('CeTI-SC', 'Centro de Tecnologia da Informação de São Carlos', 'outros@usp.br');

INSERT INTO instituto VALUES ('IEA', 'Instituto de Estudos Avançados', 'outros@usp.br');

INSERT INTO instituto VALUES ('CDCC', 'Centro de Divulgação Científica e Cultural', 'outros@usp.br');

INSERT INTO instituto VALUES ('Outros', 'Outros', 'outros@usp.br');




INSERT INTO usuario VALUES ('disjdj3834jfd', '10692224', 'Giovana Daniele da Silva', 'ICMC', 'giovana@usp.br');

INSERT INTO usuario VALUES ('dfdfkod394j3j4', '10692054', 'João Pedro Almeida Santos Secundino', 'IFSC', 'joao@usp.br')



