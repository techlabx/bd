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

CREATE TABLE instituto(
	siglaInstituto VARCHAR(10),
	nomeInstituto VARCHAR(100) NOT NULL,
	
	CONSTRAINT pk_instituto PRIMARY KEY (siglaInstituto)	
);

CREATE TABLE atendente(
	nomeAtendente VARCHAR(150) NOT NULL,
	emailAtendente VARCHAR (100),
    institutoAtendente VARCHAR(10) NOT NULL UNIQUE,
    imgAtendente VARCHAR(150), 
    statusAtendente VARCHAR(10) NOT NULL DEFAULT 'WAITING',
	
	CONSTRAINT pk_atendente PRIMARY KEY (emailAtendente, institutoAtendente),
    CONSTRAINT fk_atendente FOREIGN KEY (institutoAtendente)
			   REFERENCES instituto (siglaInstituto) ON DELETE CASCADE,
    CONSTRAINT ck_atendente CHECK(UPPER(statusAtendente) = 'CONFIRMED' OR 
                            	  UPPER(statusAtendente) = 'WAITING')
);

CREATE TABLE token(
	idToken SERIAL,
	access_token VARCHAR(256),
	refresh_token VARCHAR(256),
	scope VARCHAR(64),
	token_type CHAR(6),
	expiry_date VARCHAR(16),
	institutoToken VARCHAR(6) NOT NULL,
    linkAgenda VARCHAR(200) NOT NULL,

	CONSTRAINT pk_token PRIMARY KEY (idToken),
	CONSTRAINT fk_token FOREIGN KEY (institutoToken)
			   REFERENCES instituto (siglaInstituto) ON DELETE CASCADE
);

CREATE TABLE usuario(
	idUsuario VARCHAR(50),
	nuspUsuario VARCHAR(12) UNIQUE NOT NULL,
	nomeUsuario VARCHAR(150) NOT NULL,
	institutoUsuario VARCHAR(100) NOT NULL,
	emailUsuario VARCHAR(100) NOT NULL,
    nivelAcesso BOOLEAN NOT NULL DEFAULT 'FALSE',
	
	CONSTRAINT pk_usuario PRIMARY KEY (idUsuario),
	CONSTRAINT fk_usuario FOREIGN KEY (institutoUsuario)
			   REFERENCES instituto (siglaInstituto) ON DELETE CASCADE
);



INSERT INTO questionario VALUES ('SRQ-20', 'Self Report Questionnaire', 'Nas próximas próximas perguntas, você realizará uma autoavaliação a respeito da sua saúde em geral. Serão 24 afirmativas, e você deve selecionar sim ou não para cada afirmativa. Não existe resposta certa ou errada, por isso pedimos que você responda da forma que você julgar melhor. Caso tenha alguma dúvida, você pode nos mandar uma mensagem pelo e-mail gapsi@icmc.usp.br ou apoia.sc@usp.br.');
								  
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



-- CAMPUS SÃO CARLOS
INSERT INTO instituto VALUES ('ICMC', 'Instituto de Ciências Matemáticas e de Computação');

INSERT INTO instituto VALUES ('IQSC', 'Instituto de Química de São Carlos');

INSERT INTO instituto VALUES ('IFSC', 'Instituto de Física de São Carlos');

INSERT INTO instituto VALUES ('EESC', 'Escola de Engenharia de São Carlos');

INSERT INTO instituto VALUES ('IAU', 'Instituto de Arquitetura e Urbanismo');

-- OUTROS
INSERT INTO instituto VALUES ('PUSP', 'Prefeitura do Campus USP');

INSERT INTO instituto VALUES ('CeTI-SC', 'Centro de Tecnologia da Informação de São Carlos');

INSERT INTO instituto VALUES ('IEA', 'Instituto de Estudos Avançados');

INSERT INTO instituto VALUES ('CDCC', 'Centro de Divulgação Científica e Cultural');

INSERT INTO instituto VALUES ('Outros', 'Outros');



INSERT INTO atendente VALUES ('atendenteICMC', 'icmc@usp.br', 'ICMC', NULL, 'WAITING');

INSERT INTO atendente VALUES ('atendenteIQSC', 'iqsc@usp.br', 'IFSC', NULL, 'WAITING');

INSERT INTO atendente VALUES ('atendenteEESC', 'eesc@usp.br', 'EESC', NULL, 'WAITING');



INSERT INTO usuario VALUES ('disjdj3834jfd', '10692224', 'Giovana Daniele da Silva', 'ICMC', 'giovana@usp.br');

INSERT INTO usuario VALUES ('dfdfkod394j3j4', '10692054', 'João Pedro Almeida Santos Secundino', 'IFSC', 'joao@usp.br')
