BEGIN;

DROP TABLE IF EXISTS "answer";
CREATE TABLE "answer" (
    id integer NOT NULL,
    title text NOT NULL,
    quiz_id integer NOT NULL,
    created_at timestamp with time zone,
    color text
);


DROP TABLE IF EXISTS "levels";
CREATE TABLE "levels" (
    id integer NOT NULL,
    title text NOT NULL,
    color text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


DROP TABLE IF EXISTS "quiz";
CREATE TABLE "quiz" (
    id integer NOT NULL UNIQUE,
    langue text DEFAULT ''::text,
    theme text DEFAULT ''::text,
    question text DEFAULT ''::text NOT NULL,
    prop1 text DEFAULT ''::text NOT NULL,
    prop2 text DEFAULT ''::text NOT NULL,
    prop3 text DEFAULT ''::text NOT NULL,
    prop4 text DEFAULT ''::text NOT NULL,
    niveau integer,
    anecdote character varying(255) DEFAULT ''::character varying NOT NULL,
    wiki character varying(255) DEFAULT ''::character varying NOT NULL,
    tag_id integer NOT NULL,
    level_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    answer_id integer NOT NULL
);


CREATE SEQUENCE "quiz_answer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE "quiz_answer_id_seq" OWNED BY quiz.answer_id;


DROP TABLE IF EXISTS "quiz_has_subcategory";
CREATE TABLE "quiz_has_subcategory" (
    subcategory_id integer NOT NULL,
    quizzes_id integer NOT NULL,
    created_at timestamp with time zone,
    id integer NOT NULL

);


CREATE SEQUENCE "quiz_has_subcategory_id_seq" 
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "quiz_has_subcategory_id_seq" OWNED BY quiz_has_subcategory.id;



CREATE SEQUENCE "quiz_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE "quiz_id_seq" OWNED BY quiz.id;


DROP TABLE IF EXISTS "score";
CREATE TABLE "score" (
    id integer NOT NULL,
    number integer,
    updated_at timestamp with time zone,
    user_id integer,
    created_at timestamp with time zone
);


ALTER TABLE "score" ALTER COLUMN "id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "score_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

DROP TABLE IF EXISTS "subcategory";
CREATE TABLE "subcategory" (
    id integer NOT NULL,
    title text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    color text
);


CREATE SEQUENCE "subcategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "subcategory_id_seq" OWNED BY subcategory.id;



DROP TABLE IF EXISTS "tag";
CREATE TABLE "tag" (
    id integer NOT NULL,
    title text NOT NULL,
    color text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
    id integer NOT NULL,
    username text NOT NULL,
    mail text NOT NULL,
    score_id integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    password text NOT NULL,
    token text
);


CREATE SEQUENCE "users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "users_id_seq" OWNED BY users.id;


ALTER TABLE "quiz" ALTER COLUMN "id" SET DEFAULT nextval('quiz_id_seq'::regclass);


ALTER TABLE "quiz" ALTER COLUMN "answer_id" SET DEFAULT nextval('quiz_answer_id_seq'::regclass);


ALTER TABLE "quiz_has_subcategory" ALTER COLUMN "id" SET DEFAULT nextval('quiz_has_subcategory_id_seq'::regclass);


ALTER TABLE "subcategory" ALTER COLUMN "id" SET DEFAULT nextval('subcategory_id_seq'::regclass);


ALTER TABLE "users" ALTER COLUMN "id" SET DEFAULT nextval('users_id_seq'::regclass);


/*insert data*/

INSERT INTO "answer" ("id", "title", "quiz_id", "created_at", "color") VALUES 
(1, 'Se rafraîchir', 1, NULL, NULL),
(2, 'Nageoire dorsale', 2, NULL, NULL),
(3, 'Trop aigu', 3, NULL, NULL),
(4, 'Bénitier', 4, NULL, NULL),
(5, 'Tuer les mâles', 5, NULL, NULL),
(6, 'Pucerons', 6, NULL, NULL),
(7, 'Des cadavres', 7, NULL, NULL),
(8, 'Humide', 8, NULL, NULL),
(9, 'Langue', 9, NULL, NULL),
(10, 'Son ventre', 10, NULL, NULL),
(11, 'Usure des dents', 11, NULL, NULL),
(12, 'Vibrisses', 12, NULL, NULL),
(13, 'Rhinocéros', 13, NULL, NULL),
(14, 'Par leurs sécrétions', 14, NULL, NULL),
(15, 'Lions', 15, NULL, NULL),
(16, '2 grammes', 16, NULL, NULL),
(17, 'Éraflures', 17, NULL, NULL),
(18, '120 km/h', 18, NULL, NULL),
(19, 'En s''enroulant', 19, NULL, NULL),
(20, 'Homme', 20, NULL, NULL),
(21, 'Six mois', 21, NULL, NULL),
(22, '35 l', 22, NULL, NULL),
(23, 'Boire', 23, NULL, NULL),
(24, 'Hyacinthe', 24, NULL, NULL),
(25, 'Seize', 25, NULL, NULL),
(26, '18 mois', 26, NULL, NULL),
(27, 'Sang', 27, NULL, NULL),
(28, 'Corne', 28, NULL, NULL),
(29, 'Printemps', 29, NULL, NULL),
(30, '16 000', 30, NULL, NULL),
(31, 'Insectes', 31, NULL, NULL),
(32, 'Fourmilière', 32, NULL, NULL),
(33, '1001 pattes', 33, NULL, NULL),
(34, 'Les termites', 34, NULL, NULL),
(35, 'Le Groenland', 35, NULL, NULL),
(36, 'La Reine', 36, NULL, NULL),
(37, 'Leurs antennes', 37, NULL, NULL),
(38, 'La cigale', 38, NULL, NULL),
(39, 'Le vinaigre', 39, NULL, NULL),
(40, 'Fourmiz', 40, NULL, NULL),
(41, 'Bernard Werber', 41, NULL, NULL),
(42, 'Supercolonie', 42, NULL, NULL),
(43, 'Ouvrières', 43, NULL, NULL),
(44, 'Femelle', 44, NULL, NULL),
(45, 'Charpentières', 45, NULL, NULL),
(46, 'Soldats', 46, NULL, NULL),
(47, 'Pot-de-miel', 47, NULL, NULL),
(48, 'Les phéromones', 48, NULL, NULL),
(49, 'Les nettoyeuses', 49, NULL, NULL),
(50, 'Le tamanoir', 50, NULL, NULL),
(51, '12 600', 51, NULL, NULL),
(52, 'Monogynes', 52, NULL, NULL),
(53, '400', 53, NULL, NULL),
(54, 'Bulldog', 54, NULL, NULL),
(55, '22 km', 55, NULL, NULL),
(56, '28 ans', 56, NULL, NULL),
(57, '1 %', 57, NULL, NULL),
(58, 'Stridulations', 58, NULL, NULL),
(59, '10 millions', 59, NULL, NULL),
(60, 'Pangolin', 60, NULL, NULL),
(61, 'Lyon', 61, NULL, NULL),
(62, 'Athènes', 62, NULL, NULL),
(63, 'Agen', 63, NULL, NULL),
(64, 'Rouge', 64, NULL, NULL),
(65, 'La Havane', 65, NULL, NULL),
(66, 'Thaïlande', 66, NULL, NULL),
(67, 'Brazzaville', 67, NULL, NULL),
(68, 'Pékin', 68, NULL, NULL),
(69, 'Madrid', 69, NULL, NULL),
(70, 'Inde', 70, NULL, NULL),
(72, 'Inde', 72, NULL, NULL),
(73, 'Rio de Janeiro', 73, NULL, NULL),
(74, 'La Haye', 74, NULL, NULL),
(75, 'Une seule', 75, NULL, NULL),
(76, 'Libye', 76, NULL, NULL),
(77, 'Le Caire', 77, NULL, NULL),
(78, 'Adriatique', 78, NULL, NULL),
(79, 'New York', 79, NULL, NULL),
(80, 'Pangolin', 80, NULL, NULL),
(81, 'Lac', 81, NULL, NULL),
(82, 'Chinoise', 82, NULL, NULL),
(83, '20 millions', 83, NULL, NULL),
(84, 'Catalogne', 84, NULL, NULL),
(85, 'Casbah', 85, NULL, NULL),
(86, 'Birmanie', 86, NULL, NULL),
(87, 'Norvège', 87, NULL, NULL),
(88, 'Monrovia', 88, NULL, NULL),
(89, 'Algérie', 89, NULL, NULL),
(90, 'Peak Tram', 90, NULL, NULL),
(91, 'Oasis', 91, NULL, NULL),
(92, 'Pomme', 92, NULL, NULL),
(93, 'Bretagne', 93, NULL, NULL),
(94, 'Georges Clooney', 94, NULL, NULL),
(95, 'Rouge et blanche', 95, NULL, NULL),
(96, 'Des dosettes', 96, NULL, NULL),
(97, 'Jus de fruits', 97, NULL, NULL),
(98, 'Jean Dujardin', 98, NULL, NULL),
(99, 'Tropicana', 99, NULL, NULL),
(100, 'Champomy', 100, NULL, NULL),
(101, 'Evian', 101, NULL, NULL),
(102, 'Monster energy', 102, NULL, NULL),
(103, 'Bloody Mary', 103, NULL, NULL),
(104, 'Nestlé', 104, NULL, NULL),
(105, 'Le blanc', 105, NULL, NULL),
(106, 'Noire', 106, NULL, NULL),
(107, 'Canada Dry', 107, NULL, NULL),
(108, 'Jacques Vabres', 108, NULL, NULL),
(109, 'Banga', 109, NULL, NULL),
(110, 'Ricoré', 110, NULL, NULL),
(111, 'Pastis51', 111, NULL, NULL),
(112, 'Taurine', 112, NULL, NULL),
(113, 'De la cocaïne', 113, NULL, NULL),
(114, 'Islande', 114, NULL, NULL),
(115, 'Open Cola', 115, NULL, NULL),
(116, 'Zinedine Zidane', 116, NULL, NULL),
(117, 'Canada Dry', 117, NULL, NULL),
(118, '1898', 188, NULL, NULL),
(119, 'Boston', 119, NULL, NULL),
(120, '1783', 120, NULL, NULL),
(121, '67 394', 121, NULL, NULL),
(122, 'LOSC Lille', 122, NULL, NULL),
(123, 'Stade de Reims', 123, NULL, NULL),
(124, 'AJ Auxerre', 124, NULL, NULL),
(125, 'Nîmes olympiques', 125, NULL, NULL),
(126, 'Armand-Cesari', 126, NULL, NULL),
(127, 'FC Lorient', 127, NULL, NULL),
(128, 'Stadium Municipal', 128, NULL, NULL),
(129, 'Le Chaudron', 129, NULL, NULL),
(130, 'Une rivière', 130, NULL, NULL),
(131, 'RC Lens', 131, NULL, NULL),
(132, 'Strasbourg', 132, NULL, NULL),
(133, 'Saint-Symphorien', 133, NULL, NULL),
(134, 'Jonelière', 134, NULL, NULL),
(135, 'Stade Océane', 135, NULL, NULL),
(136, 'Marcel Picot', 136, NULL, NULL),
(137, 'FC Sochaux', 137, NULL, NULL),
(138, 'Roazhon park', 138, NULL, NULL),
(139, 'Tours FC', 139, NULL, NULL),
(140, 'Stade Vélodrome', 140, NULL, NULL),
(141, 'Décines-Charpieu', 141, NULL, NULL),
(142, 'Louis Fonteneau', 142, NULL, NULL),
(143, 'Stade du Ray', 143, NULL, NULL),
(144, 'Stade Léon-Bollée', 144, NULL, NULL),
(145, 'CS Sedan Ardennes', 145, NULL, NULL),
(146, 'Bocca', 146, NULL, NULL),
(147, 'Roudourou', 147, NULL, NULL),
(148, 'Duathlon', 148, NULL, NULL),
(149, 'Lyon', 149, NULL, NULL),
(150, 'Ange-Casanova', 150, NULL, NULL),
(151, '140', 151, NULL, NULL),
(152, 'Pinterest', 152, NULL, NULL),
(153, 'Marc Zukerberg', 153, NULL, NULL),
(154, 'Linkedin', 154, NULL, NULL),
(155, 'Des photos', 155, NULL, NULL),
(156, 'Ellen DeGeneres', 156, NULL, NULL),
(157, 'Une vidéo', 157, NULL, NULL),
(158, 'Vine', 158, NULL, NULL),
(159, 'Pinterest', 159, NULL, NULL),
(160, 'Linkedin', 160, NULL, NULL),
(161, 'Reddit', 161, NULL, NULL),
(162, 'Slingshot', 162, NULL, NULL),
(163, '300 millions', 163, NULL, NULL),
(164, '80%', 164, NULL, NULL),
(165, '2006', 165, NULL, NULL),
(166, 'Foursquare', 166, NULL, NULL),
(167, 'CIA', 167, NULL, NULL),
(168, 'Des cadeaux', 168, NULL, NULL),
(169, '55 millions', 169, NULL, NULL),
(170, 'Tumblr', 170, NULL, NULL),
(171, 'Viadeo', 171, NULL, NULL),
(172, '19 milliards', 172, NULL, NULL),
(173, 'Piwie', 173, NULL, NULL),
(174, 'Disneyland', 174, NULL, NULL),
(175, 'Kipi', 175, NULL, NULL),
(176, 'XING', 176, NULL, NULL),
(177, 'LINE', 177, NULL, NULL),
(178, 'Renren', 178, NULL, NULL),
(179, 'Plaxo', 179, NULL, NULL),
(180, 'VK', 180, NULL, NULL),
(181, 'Tatooine', 181, NULL, NULL),
(182, 'Chewbacca', 181, NULL, NULL),
(183, 'Ben', 183, NULL, NULL),
(184, 'Faucon Millenium', 184, NULL, NULL),
(185, 'C-3PO', 185, NULL, NULL),
(186, 'Chasseur de Primes', 186, NULL, NULL),
(187, 'Ewok', 187, NULL, NULL),
(188, 'Frère et soeur', 188, NULL, NULL),
(189, 'Luke Skywalker', 189, NULL, NULL),
(190, 'Mark Hamill', 190, NULL, NULL),
(191, 'Jabba Le Hut', 191, NULL, NULL),
(192, 'La Princesse Leia', 192, NULL, NULL),
(193, 'Violette', 193, NULL, NULL),
(194, 'Dark Sidious', 194, NULL, NULL),
(195, 'Dark Sidious', 195, NULL, NULL),
(196, 'Dark Maul', 196, NULL, NULL),
(197, 'Deux', 197, NULL, NULL),
(198, 'Luke', 198, NULL, NULL),
(199, 'Boba', 199, NULL, NULL),
(200, 'Jar Jar Binks', 200, NULL, NULL),
(201, '900 ans', 201, NULL, NULL),
(202, 'Sebulba', 202, NULL, NULL),
(203, 'Shmi', 203, NULL, NULL),
(204, 'Ordre 66', 204, NULL, NULL),
(205, 'Neimoidien', 205, NULL, NULL),
(206, 'Dark Tyranus', 206, NULL, NULL),
(207, 'Watoo', 207, NULL, NULL),
(208, 'Leai Organa', 208, NULL, NULL),
(209, 'Plo Koon', 209, NULL, NULL),
(210, 'Shaak Ti', 210, NULL, NULL),
(211, 'Une rose', 211, NULL, NULL),
(212, 'En citrouille', 212, NULL, NULL),
(213, 'Blanche-Neige', 213, NULL, NULL),
(214, 'Sept', 214, NULL, NULL),
(215, 'Blanche-Neige', 215, NULL, NULL),
(216, 'Par un baiser', 216, NULL, NULL),
(217, 'Blanche-Neige', 217, NULL, NULL),
(218, 'Cendrillon', 218, NULL, NULL),
(219, 'Minuit', 219, NULL, NULL),
(220, 'Blanche-Neige', 220, NULL, NULL),
(221, 'Rose', 221, NULL, NULL),
(222, 'Mulan', 222, NULL, NULL),
(223, 'Ariel', 223, NULL, NULL),
(224, 'Jasmine', 224, NULL, NULL),
(225, 'Raiponce', 225, NULL, NULL),
(226, 'Aladdin', 226, NULL, NULL),
(227, 'Des souris', 227, NULL, NULL),
(228, 'Un raton-laveur', 228, NULL, NULL),
(229, 'Merida', 229, NULL, NULL),
(230, 'Tiana', 230, NULL, NULL),
(231, 'Mulan', 231, NULL, NULL),
(232, 'Des diamants', 232, NULL, NULL),
(233, '100 ans', 233, NULL, NULL),
(234, 'Lucifer', 234, NULL, NULL),
(235, 'Mushu', 235, NULL, NULL),
(236, 'Un tigre', 236, NULL, NULL),
(237, 'Souris', 237, NULL, NULL),
(238, 'Naomi Campbell', 238, NULL, NULL),
(239, 'Pocahontas', 239, NULL, NULL),
(240, 'Belle', 240, NULL, NULL),
(241, 'Thomas', 241, NULL, NULL),
(242, 'Loft Story', 242, NULL, NULL),
(243, 'Koh Lanta', 243, NULL, NULL),
(244, 'Jenifer', 244, NULL, NULL),
(245, 'Grégory Basso', 245, NULL, NULL),
(246, 'Loft Story', 246, NULL, NULL),
(247, 'Nikos Aliagas', 247, NULL, NULL),
(248, 'Secret Story', 248, NULL, NULL),
(249, 'Master Chef', 249, NULL, NULL),
(250, 'Les Chtis', 250, NULL, NULL),
(251, 'Stephane Rotenberg', 251, NULL, NULL),
(252, 'Popstars', 252, NULL, NULL),
(253, 'Italienne', 253, NULL, NULL),
(254, 'Dilemme', 254, NULL, NULL),
(255, 'André Manoukian', 255, NULL, NULL),
(256, 'Des millionnaires', 256, NULL, NULL),
(257, 'W9', 257, NULL, NULL),
(258, 'Star Academy', 258, NULL, NULL),
(259, 'Endemol', 259, NULL, NULL),
(260, 'Bachelor', 260, NULL, NULL),
(261, 'Saison 4', 261, NULL, NULL),
(262, 'Neuf', 262, NULL, NULL),
(263, 'Les colocataires', 263, NULL, NULL),
(264, 'Nathalie Simon', 264, NULL, NULL),
(265, 'Une princesse', 265, NULL, NULL),
(266, 'Les colocataires', 266, NULL, NULL),
(267, 'Richard Virenque', 267, NULL, NULL),
(268, 'Céline Catalaa', 268, NULL, NULL),
(269, 'Alizée', 269, NULL, NULL),
(270, 'Matthieu Delormeau', 270, NULL, NULL),
(71, 'Le Caire', 71, NULL, NULL);


INSERT INTO "levels" ("id", "title", "color", "created_at", "updated_at") VALUES 
    (1, 'Débutant', 'green', '2020-09-18 12:16:38.251232', NULL),
    (2, 'Intermédiare', 'yellow', '2020-09-18 12:16:38.251232', NULL),
    (3, 'Expert', 'red', '2020-09-18 12:16:38.251232', NULL);

-- 

INSERT INTO "quiz" ("id", "langue", "theme", "question", "prop1", "prop2", "prop3", "prop4", "niveau", "anecdote", "wiki", "tag_id", "level_id", "created_at", "updated_at", "answer_id") VALUES 
     (1, 'fr', 'Animaux en vrac', 'Pourquoi les ours polaires se couchent-ils dans la neige lorsquils courent ?', 'Se reposer', 'Dormir', 'Se rafraîchir', 'Manger', 1, 'Les ours polaires peuvent rapidement avoir trop chaud sous leur fourrure très épaisse et leur couche de graisse isolante.', 'https://fr.wikipedia.org/wiki/Ours_blanc', 1, 1, '2020-09-16 18:56:33.382527', NULL, 1),
     (2, 'fr', 'Animaux en vrac', 'Quelle partie du corps permet aux hippocampes de nager ?', 'Nageoire dorsale', 'Tête','Nageoire ventrale', 'Queue', 1, 'Malgré qu''ils soient des poissons, les hippocampes ne nagent que très lentement en effectuant des mouvements onduleux.', 'https://fr.wikipedia.org/wiki/Hippocampe_(poisson)', 1, 1, '2020-09-16 18:56:33.382527', NULL, 2),
     (3, 'fr', 'Animaux en vrac', 'Pour quelle raison ne pouvons-nous pas entendre les cris de la chauve-souris ?', 'Trop faible', 'Trop grave', 'Trop fort', 'Trop aigu',1, 'Les chauves-souris émettent et reçoivent des ultrasons que notre oreille ne peut percevoir (max 20 000 hertz).', 'https://fr.wikipedia.org/wiki/Chiroptera', 1, 1, '2020-09-16 18:56:33.382527', NULL, 3),
     (4, 'fr', 'Animaux en vrac', 'À quoi servait la coquille du tridacne géant dans de nombreuses églises ?', 'Bénitier', 'Tronc', 'Corbeille à pain','Chandelier',  1, 'Il y a 300 ans, les coquilles étaient considérées comme des objets précieux et servaient de bénitier à ''entrée des églises.', 'https://fr.wikipedia.org/wiki/Tridacne_géant', 1, 1, '2020-09-16 18:56:33.382527', NULL, 4),
     (5, 'fr', 'Animaux en vrac', 'Quelle lourde et pénible tâche incombe à la reine des fourmis ?', 'Défendre le nid','Pondre des oeufs',  'Chercher à manger', 'Tuer les mâles', 1, 'La reine est la seule fourmi du nid à pondre des oeufs qui sont en réalité des larves écloses dont naîtront les futures fourmis.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 18:56:33.382527', NULL, 5),
     (6, 'fr', 'Animaux en vrac', 'Qu''est-ce que les coccinelles aiment tout particulièrement manger ?',  'Pétales', 'Éxcréments','Pucerons', 'Écorces', 1, 'Considérées comme animaux utiles, on élève les coccinelles puis on les utilise pour combattre écologiquement les parasites.', 'https://fr.wikipedia.org/wiki/Coccinellidae', 1, 1, '2020-09-16 18:56:33.382527', NULL, 6),
     (7, 'fr', 'Animaux en vrac', 'Pour quelle raison les nécrophores se battent-ils entre eux ?', 'Des femelles','Des cadavres',  'Un territoire', 'De l''or', 1, 'Un couple de nécrophores enterre un animal mort dans le sol et y pond ses oeufs dont les larves sont nourries.', 'https://fr.wikipedia.org/wiki/Nécrophore', 1, 1, '2020-09-16 18:56:33.382527', NULL, 7),
     (8, 'fr', 'Animaux en vrac', 'De quel type d''environnement un acarien a-t-il besoin pour vivre ?', 'Sec',  'Humide','Gras', 'Ensoleillé', 1, 'Sans les acariens, qui nichent dans nos matelas et les endroits humides, les forêts seraient submergées de feuilles mortes.', 'https://fr.wikipedia.org/wiki/Acari', 1, 1, '2020-09-16 18:56:33.382527', NULL, 8),
     (9, 'fr', 'Animaux en vrac', 'Quelle partie du corps de la limace lui permet-elle de découper les plantes ?', 'Dents', 'Palais',  'Langue', 'Bras', 1, 'Telle une lime, la langue rêche de la limace râpe les plantes tendres en petits morceaux et dépouille ainsi les jeunes salades.', 'https://fr.wikipedia.org/wiki/Limace', 1, 1, '2020-09-16 18:56:33.382527', NULL, 9),
     (10, 'fr', 'Animaux en vrac', 'Quelle partie du corps montre le loup le plus faible après une lutte pour la hiérarchie ?', 'Son ventre', 'Sa langue', 'Sa queue', 'Ses dents', 1, 'Le loup inférieur n''est ainsi pas blessé mais devra à l''avenir se soumettre au mâle dominant, selon leur hiérarchie prononcée.', 'https://fr.wikipedia.org/wiki/Canis_lupus', 1, 1, '2020-09-16 18:56:33.382527', NULL, 10),
     (11, 'fr', 'Animaux en vrac', 'Quelle est la cause de mortalité la plus fréquente chez les éléphants en liberté ?', 'Trompe cassée',  'Usure des dents', 'Maladie', 'Morsure de lion', 2, 'Lorsque la dernière molaire est usée par la mastication, l''éléphant ne peut plus se nourrir suffisamment et meurt tristement de faim.', 'https://fr.wikipedia.org/wiki/Éléphant', 1, 2, '2020-09-16 19:07:51.258251', NULL, 11),
     (12, 'fr', 'Animaux en vrac', 'Grâce à quelle partie de son corps la taupe s''oriente-t-elle sous terre ?', 'Museau', 'Vibrisses', 'Yeux', 'Oreilles', 2, 'Les taupes s''orientent presque exclusivement en utilisant une sorte de moustaches et tâtent leur nourriture de cette manière.', 'https://fr.wikipedia.org/wiki/Taupe', 1, 2, '2020-09-16 19:07:51.258251', NULL, 12),
     (13, 'fr', 'Animaux en vrac', 'À part le cheval, à quel autre animal le tapir est-il apparenté ?', 'Éléphant','Rhinocéros', 'Cochon', 'Hamster', 2, 'Les tapirs, de la famille des ongulés, utilisent leur trompe comme main et peuvent ainsi la rétracter lorsque celle-ci les gêne.', 'https://fr.wikipedia.org/wiki/Tapir', 1, 2, '2020-09-16 19:07:51.258251', NULL, 13),
     (14, 'fr', 'Animaux en vrac', 'Comment les mille-pattes se protègent-ils de leurs prédateurs ?', 'Par camouflage', 'Par leurs sécrétions', 'En criant', 'En mordant', 2, 'En cas de danger, les mille-pattes émettent une substance rouge caustique à l''odeur nauséabonde via des glandes sur leurs anneaux.', 'https://fr.wikipedia.org/wiki/Myriapoda', 1, 2, '2020-09-16 19:07:51.258251', NULL, 14),
     (15, 'fr', 'Animaux en vrac', 'Quels animaux volent souvent aux hyènes la proie qu''elles ont chassée ?', 'Gnous',  'Lions','Guépards', 'Buffles', 2, 'Les hyènes chassent généralement en meute d''environ quarante individus des animaux tels que les zèbres ou les gnous.', 'https://fr.wikipedia.org/wiki/Hyaenidae', 1, 2, '2020-09-16 19:07:51.258251', NULL, 15),
     (16, 'fr', 'Animaux en vrac', 'Combien pèse environ la plus petite espèce de musaraigne connue ?',  '20 grammes', '70 grammes', '130 grammes','2 grammes', 2, 'Notre musaraigne pygmée locale est, quant à elle, deux fois plus grande et plus lourde que ce pachyure étrusque.', 'https://fr.wikipedia.org/wiki/Musaraigne', 1, 2, '2020-09-16 19:07:51.258251', NULL, 16),
     (17, 'fr', 'Animaux en vrac', 'De quelle manière le lynx a-t-il l''habitude de marquer son territoire ?',  'Excréments','Éraflures', 'Poils', 'Souris mortes', 2, 'Outre des éraflures, les lynx utilisent parfois également leur urine comme marque odorante afin de délimiter leur domaine.', 'https://fr.wikipedia.org/wiki/Lynx', 1, 2, '2020-09-16 19:07:51.258251', NULL, 17),
     (18, 'fr', 'Animaux en vrac', 'Taillé pour la course, jusqu''à quelle vitesse un guépard peut-il courir ?', '90 km/h', '60 km/h','120 km/h', '150 km/h', 2, 'Le plus rapide des animaux ne peut maintenir cette vitesse que sur quelques centaines de mètres, laissant une chance aux gazelles.', 'https://fr.wikipedia.org/wiki/Guépard', 1, 2, '2020-09-16 19:07:51.258251', NULL, 18),
     (19, 'fr', 'Animaux en vrac', 'Comment les cloportes se protègent-ils des attaques ?', 'En s''enfuyant','En s''enroulant', 'En s''enterrant', 'En s''envolant', 2, 'Le corps d''un cloporte, dans ce cas immobile, est composé de plusieurs anneaux solides qui rappellent une armure de chevalier.', 'https://fr.wikipedia.org/wiki/Cloporte', 1, 2, '2020-09-16 19:07:51.258251', NULL, 19),
     (20, 'fr', 'Animaux en vrac', 'Quel animal est le plus grand ennemi connu de la buse variable ?', 'Renard', 'Aigle', 'Homme', 'Ours brun', 2, 'De nombreuses buses sont écrasées par l''homme lorsqu''elles tentent de récupérer des cadavres d''animaux sur les autoroutes.', 'https://fr.wikipedia.org/wiki/Buse_variable', 1, 2, '2020-09-16 19:07:51.258251', NULL, 20),
     (21, 'fr', 'Animaux en vrac', 'Après combien de temps un bébé tigre reçoit-il de la viande pour la première fois ?', 'Six mois', 'Un mois', 'Un an', 'Six ans', 3, 'Au cours des six premiers mois, les bébés tigres qui ne connaissent pas leur père sont allaités par leur mère.', 'https://fr.wikipedia.org/wiki/Tigre', 1, 3, '2020-09-16 19:10:35.551407', NULL, 21),
     (22, 'fr', 'Animaux en vrac', 'Combien de litres de lait une vache performante produit-elle chaque jour ?', '35 l', '25 l', '15 l', '5 l', 3, 'Ces vaches fortement exploitées souffrent le plus souvent d''une inflammation des pis et nécessitent beaucoup de médicaments.', 'https://fr.wikipedia.org/wiki/Vache', 1, 3, '2020-09-16 19:10:35.551407', NULL, 22),
     (23, 'fr', 'Animaux en vrac', 'De quelle fonction vitale le fennec peut-il étonnamment se passer ?', 'Boire', 'Manger', 'Dormir', 'Voir', 3, 'Le liquide que le fennec absorbe grâce à son alimentation lui suffit et est donc admirablement adapté à la vie dans le désert.', 'https://fr.wikipedia.org/wiki/Fennec', 1, 3, '2020-09-16 19:10:35.551407', NULL, 23),
     (24, 'fr', 'Animaux en vrac', 'Quel est le plus grand des aras parmi les perroquets connus à ce jour ?', 'Hyacinthe', 'Macao', 'Ararauna', 'Chloroptère', 3, 'Ce perroquet d''environ 150 cm, queue comprise, possède un plumage bleu clair uni et vit principalement en Bolivie et au Brésil.', 'https://fr.wikipedia.org/wiki/Ara_(oiseau)', 1, 3, '2020-09-16 19:10:35.551407', NULL, 24),
     (25, 'fr', 'Animaux en vrac', 'De manière générale, combien d''heures par jour un panda géant est-il occupé à manger ?', 'Seize', 'Douze', 'Huit', 'Quatre', 3, 'Le panda géant mange uniquement des jeunes pousses de bambou mais celles-ci ne sont toutefois pas très nourrissantes.', 'https://fr.wikipedia.org/wiki/Panda_géant', 1, 3, '2020-09-16 19:10:35.551407', NULL, 25),
     (26, 'fr', 'Animaux en vrac', 'Combien de temps un bébé morse est-il allaité par sa mère ?', '1 mois', '6 mois', '1 an', '18 mois', 3, 'Après une période de 12 mois de gestation, le bébé morse pèse plus de 50 kg et sait déjà nager au bout de deux semaines seulement.', 'https://fr.wikipedia.org/wiki/Morse_(animal)', 1, 3, '2020-09-16 19:10:35.551407', NULL, 26),
     (27, 'fr', 'Animaux en vrac', 'Pour quelle raison les martres tuent-elles parfois les poules ?', 'Sang', 'Pattes', 'Foie', 'Cuisses', 3, 'Les martres boivent uniquement le sang et laissent le reste, préférant manger des lapins, des oeufs, des lézards ou des insectes.', 'https://fr.wikipedia.org/wiki/Martre_des_pins', 1, 3, '2020-09-16 19:10:35.551407', NULL, 27),
     (28, 'fr', 'Animaux en vrac', 'De quoi est constituée la sonnette du serpent à sonnette ?', 'Bois',  'Corne','Calcaire', 'Pierres', 3, 'Les six à dix anneaux de corne situés à l''extrémité de la queue du serpent à sonnette proviennent des mues précédentes.', 'https://fr.wikipedia.org/wiki/Crotalus', 1, 3, '2020-09-16 19:10:35.551407', NULL, 28),
     (29, 'fr', 'Animaux en vrac', 'Durant quelle saison de l''année peut-on entendre le hibou crier ?', 'Automne',  'Été', 'Printemps','Hiver', 3, 'Le hibou mâle crie en avril et en mai pour attirer l''attention d''une femelle qui restera alors toute sa vie fidèlement à ses côtés.', 'https://fr.wikipedia.org/wiki/Hibou', 1, 3, '2020-09-16 19:10:35.551407', NULL, 29),
     (30, 'fr', 'Animaux en vrac', 'De combien de piquants est composée la fourrure du hérisson mâle ?', '12 000', '16 000', '8 000', '4 000', 3, 'En cas de danger, le hérisson peut ainsi dresser ses nombreux piquants et s''enrouler sur lui-même pour se protéger des ennemis.', 'https://fr.wikipedia.org/wiki/Hérisson', 1, 3, '2020-09-16 19:10:35.551407', NULL, 30),
     (31, 'fr', 'Fourmis', 'De quelle espèce animale font partie les fourmis, de l''ordre des hyménoptères ?', 'Insectes', 'Mammifères', 'Poissons', 'Invertébrés', 1, 'Certaines espèces de fourmis forment des supercolonies à plusieurs centaines de millions d''individus et à plus de 50 colonies.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 31),
     (32, 'fr', 'Fourmis', 'Quel habitat des fourmis est généralement conçu par construction de dômes ?', 'Fourmilière', 'Nid', 'Cage', 'Niche', 1, 'La fourmilière a pour but de protéger la ou les reines et de garantir à la colonie une sécurité et un abri face aux intempéries.', 'https://fr.wikipedia.org/wiki/Fourmilière', 1, 1, '2020-09-16 19:15:47.796537', NULL, 32),
     (33, 'fr', 'Fourmis', 'Dans quel film d''animation des studios Pixar Tilt est-il un ouvrier fourmi ?', ' Toy Story ', ' Monstres et Cie ', ' Ratatouille ',' 1001 pattes ',  1, 'Woody le cow-boy héros du film d''animation  Toy Story  est apparu dans le bêtisier du générique de fin.', 'https://fr.wikipedia.org/wiki/1001_pattes', 1, 1, '2020-09-16 19:15:47.796537', NULL, 33),
     (34, 'fr', 'Fourmis', 'Quels insectes sont parfois appelés  fourmis blanches  au sein de colonies hiérarchisées ?', 'Les blattes', 'Les cafards', 'Les termites', 'Les cancrelats', 1, 'Les termites se rencontrent surtout dans les pays chauds, où certaines espèces construisent de grands nids en terre mâchée.', 'https://fr.wikipedia.org/wiki/Termite', 1, 1, '2020-09-16 19:15:47.796537', NULL, 34),
     (35, 'fr', 'Fourmis', 'Avec l''Antarctique, quelle région du monde n''est pas colonisée par les fourmis ?', 'L''Afrique du Sud', 'La Russie',  'Le Groenland','Le Japon', 1, 'En 2013, plus de 12 000 espèces ont été répertoriées, mais il en reste probablement des milliers encore à découvrir.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 35),
     (36, 'fr', 'Fourmis', 'Au sein d''une colonie de fourmis, qui pond les oeufs dans la fourmilière ?', 'La reine', 'L''ouvrière', 'La guerrière', 'La tisserande', 1, 'Certaines espèces de fourmis peuvent tolérer plusieurs reines lorsque la colonie est conséquente.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 36),
     (37, 'fr', 'Fourmis', 'Avec quoi les fourmis sentent-elles le repérage de pistes olfactives ?','Leurs pattes', 'Leur abdomen', 'Leur queue', 'Leurs antennes',  1, 'Les fourmis peuvent aussi détecter à quel groupe de travail (par exemple la recherche de nourriture) l''une ou l''autre appartient.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 37),
     (38, 'fr', 'Fourmis', 'Avec quel autre insecte la fourmi partage-t-elle une célèbre fable de Jean de La Fontaine ?','La mouche',  'La cigale',  'La coccinelle', 'La libellule', 1, ' La Cigale et la Fourmi  est la première fable du livre I de Jean de La Fontaine située dans le premier recueil des  Fables de La Fontaine .', 'https://fr.wikipedia.org/wiki/La_Cigale_et_la_Fourmi_(La_Fontaine)', 1, 1, '2020-09-16 19:15:47.796537', NULL, 38),
     (39, 'fr', 'Fourmis', 'Laquelle de ces méthodes semble radicale pour tenir éloigné les fourmis de son habitation ?', 'Le vinaigre', 'Le sucre', 'Le miel', 'Le riz', 1, 'Certaines odeurs fortes ont une action répulsive sur les fourmis, comme c''est notamment le cas du jus de citron et du vinaigre.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 1, '2020-09-16 19:15:47.796537', NULL, 39),
     (40, 'fr', 'Fourmis', 'Quel film du studio Dreamworks sorti en 1998 relate la vie des fourmis ?',' Chicken Run ', ' Shrek ', ' Madagascar ',  ' Fourmiz ',  1, 'Seulement un mois après la sortie du film fut proposé le film d''animation  1001 pattes  du  concurrent historique  Pixar.', 'https://fr.wikipedia.org/wiki/Fourmiz', 1, 1, '2020-09-16 19:15:47.796537', NULL, 40),
     (41, 'fr', 'Fourmis', 'Quel écrivain français né à Toulouse a publié une célèbre trilogie sur les fourmis ?', 'Bernard Werber', 'Gaston Boca', 'Robert Merle', 'Alain Grousset', 2, 'Son oeuvre, traduite dans une trentaine de langues, fait se rencontrer spiritualité, science-fiction, polar, biologie et mythologie.', 'https://fr.wikipedia.org/wiki/Bernard_Werber', 1, 2, '2020-09-17 11:13:40.552188', NULL, 41),
     (42, 'fr', 'Fourmis', 'Quel terme est utilisé pour désigner une colonie de fourmis formées de plusieurs reines ?','Métapopulation', 'Écotype', 'Supercolonie',  'Épifaune', 2, 'Les ouvrières s''y déplacent librement de nids en nids, comme si la population entière était une unique colonie.', 'https://fr.wikipedia.org/wiki/Supercolonie', 1, 2, '2020-09-17 11:13:40.552188', NULL, 42),
     (43, 'fr', 'Fourmis', 'Chez les fourmis, comment appelle-t-on les femelles aptères et stériles ?', 'Ouvrières', 'Guerrières', 'Reines', 'Nettoyeuses', 2, 'Les différences morphologiques majeures entre les castes d''ouvrières sont induites par le régime alimentaire au stade larvaire.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 43),
     (184, 'fr', 'Héros de Star Wars', 'Quel est le nom du vaisseau spatial du contrebandier Han Solo ?', 'Faucon Millenium', 'Aigle Solitaire', 'B-Wing', 'Speeder', 1, 'Le vaisseau fut appelé  Millenium Condor  dans la version française du premier épisode produit.', 'https://fr.wikipedia.org/wiki/Faucon_Millenium', 6, 1, '2020-09-18 21:10:50.252078', NULL, 184),
     (186, 'fr', 'Héros de Star Wars', 'Quel métier est exercé par Jango Fett, humain originaire de Concord Dawn ?', 'Chasseur de primes', 'Sénateur', 'Vendeur de droïdes', 'Musicien', 1, 'Inventif, sachant se sortir de toutes les situations, Jango Fett est apprécié pour son professionnalisme par ses commanditaires.', 'https://fr.wikipedia.org/wiki/Jango_Fett', 6, 1, '2020-09-18 21:10:50.252078', NULL, 186),
     (187, 'fr', 'Héros de Star Wars', 'Dans l''univers de  Star Wars , quelle espèce vit sur la lune forestière de la planète Endor ?','Wookiee', 'Sarlacc',  'Ewok',  'Tusken', 1, 'Physiquement, ces mammifères humanoïdes omnivores mesurent environ un mètre de haut.', 'https://fr.wikipedia.org/wiki/Ewok', 6, 1, '2020-09-18 21:10:50.252078', NULL, 187),
     (188, 'fr', 'Héros de Star Wars', 'Quel est le lien de parenté entre Luke Skywalker et la Princesse Leia ?','Cousin et cousine', 'Oncle et tante', 'Mari et femme',  'Frère et soeur',  1, 'Luke et Leila sont les deux enfants d''Anakin Skywalker et de Padmé Amidala.', 'https://fr.wikipedia.org/wiki/Luke_Skywalker', 6, 1, '2020-09-18 21:10:50.252078', NULL, 188),
     (189, 'fr', 'Héros de Star Wars', 'Quel célèbre personnage de  Star Wars  a été élevé par son oncle et sa tante ?', 'Luke Skywalker', 'Han Solo', 'Chewbacca', 'Plo Koon', 1, 'Luke Skywalker a vu le jour sur l''astéroïde de Polis Massa, peu de temps après la création de l''Empire galactique.', 'https://fr.wikipedia.org/wiki/Luke_Skywalker', 6, 1, '2020-09-18 21:10:50.252078', NULL, 189),
     (190, 'fr', 'Héros de Star Wars', 'Quel acteur est célèbre pour avoir tenu le rôle de Luke Skywalker dans la saga  Star Wars  ?', 'Harrison Ford', 'Alec Guinness', 'Mark Hamill',  'Liam Neeson', 1, 'Mark Hamill a trouvé une nouvelle carrière dans le doublage de dessins animés et de jeux vidéo.', 'https://fr.wikipedia.org/wiki/Mark_Hamill', 6, 1, '2020-09-18 21:10:50.252078', NULL, 190),
     (191, 'fr', 'Héros de Star Wars', 'Quel personnage de  Star Wars  a été conçu comme un alien ressemblant à une limace ?', 'Jabba le Hutt', 'Dark Maul', 'Mace Windu', 'Lando Calrissian', 2, 'Le critique Roger Ebert considère que son apparence physique le rapproche d''un croisement entre un crapaud et le chat du Cheshire.', 'https://fr.wikipedia.org/wiki/Jabba_le_Hutt', 6, 2, '2020-09-18 21:10:50.252078', NULL, 191),
     (192, 'fr', 'Héros de Star Wars', 'Qui a enregistré un message dans les circuits intégrés de R2-D2 dans  Un Nouvel Espoir  ?', 'La Princesse Leia', 'Anakin', 'Chewbacca', 'Obi-Wan', 2, 'R2-D2 arrive tant bien que mal à se faire comprendre par les autres au gré de ses sifflements.', 'https://fr.wikipedia.org/wiki/R2-D2', 6, 2, '2020-09-18 21:10:50.252078', NULL, 192),
     (193, 'fr', 'Héros de Star Wars', 'Quelle est la couleur du sabre laser de Mace Windu, créateur de la technique du Vaapad ?','Rouge', 'Violette', 'Verte', 'Bleue', 2, 'En plus de sa réputation de sage, Windu est considéré comme l''un des meilleurs combattants au sabre laser de l''Ordre Jedi.', 'https://fr.wikipedia.org/wiki/Mace_Windu', 6, 2, '2020-09-18 21:10:50.252078', NULL, 193),
     (194, 'fr', 'Héros de Star Wars', 'Qui était le maître du Comte Dooku, membre des systèmes indépendants ?', 'Dark Sidious', 'Dark Bane', 'Dark Vador', 'Dark Maul', 2, 'Dooku fut l''héritier d''une famille d''aristocrates et diplomates de Serenno à la fortune colossale.', 'https://fr.wikipedia.org/wiki/Comte_Dooku', 6, 2, '2020-09-18 21:10:50.252078', NULL, 194),
     (195, 'fr', 'Héros de Star Wars', 'Sous quel autre nom connaît-on le Chancelier Palpatine, originaire de Naboo ?', 'Dark Sidious', 'Dark Bane', 'Dark Malak', 'Dark Vador', 2, 'Palpatine s''est fixé comme mission de rétablir l''Ordre Sith et de détruire les Jedi grâce à un vaste complot.', 'https://fr.wikipedia.org/wiki/Palpatine', 6, 2, '2020-09-18 21:10:50.252078', NULL, 195),
     (196, 'fr', 'Héros de Star Wars', 'Quel seigneur Sith, très habile à manier le sabre double, a tué Qui-Gon Jinn ?','Le Compte Dooku', 'Bail Organa', 'Kit Fisto',  'Dark Maul',  2, 'Le personnage de Qui-Gon Jinn, interprété par Liam Neeson, est doublé en France par Samuel Labarthe.', 'https://fr.wikipedia.org/wiki/Qui-Gon_Jinn', 6, 2, '2020-09-18 21:10:50.252078', NULL, 196),
     (45, 'fr', 'Fourmis', 'Quelles fourmis, pourtant parfois de petite taille, font leurs nids en creusant le bois ?', 'Pot-de-miel', 'Charpentières',  'Moissonneuses', 'Tisserandes', 2, 'Les ouvrières varient en taille et certaines d''entre elles comptent parmi les plus grandes espèces d''Europe.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 45),
     (46, 'fr', 'Fourmis', 'Comment sont parfois appelées les ouvrières géantes au sein d''une colonie de fourmis ?', 'Soldats', 'Ouvrières', 'Guêpes', 'Pondeuses', 2, 'Les plus grandes ouvrières sont parfois appelées  soldats , bien que leur rôle défensif ne soit pas nécessairement prépondérant.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 46),
     (51, 'fr', 'Fourmis', 'Environ combien d''espèces de fourmis ont été répertoriées en 2013 ?', '12 600', '10 500', '8 400', '6 700', 3, 'Bien que les fourmis représentent moins d''un pour cent des espèces d''insectes, leur masse totale excède le poids de l''humanité.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 51),
     (52, 'fr', 'Fourmis', 'Comment sont appelées les espèces de fourmis possédant une seule reine ?', 'Monogynes', 'Phytozoaires', 'Zoophytes', 'Euryapsides', 3, 'Ce terme est également applicable chez les abeilles, les guêpes, les termites et rats-taupes nus.', 'https://fr.wikipedia.org/wiki/Monogyne', 1, 3, '2020-09-17 11:16:25.655314', NULL, 52),
     (53, 'fr', 'Fourmis', 'Environ combien d''espèces de fourmis sont connues en Europe ?','4 000', '400',  '40 000', '400 000', 3, 'En forêt tropicale en Malaisie, on peut compter jusqu\à 40 espèces différentes sur un seul mètre carré.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 53),
     (54, 'fr', 'Fourmis', 'La piqûre répétée de quelle fourmi peut être mortelle pour l''homme ?', 'Bulldog', 'Veuve noire', 'Tigre', 'Taïpan', 3, 'Même si les attaques sur l''être humain sont plutôt rares, les piqûres peuvent être mortelles en raison d''un possible choc anaphylactique.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 54),
     (55, 'fr', 'Fourmis', 'Jusqu''à quelle profondeur a-t-on retrouvé des fourmis en Asie du Sud-Est ?','18 km', '14 km', '10 km',  '22 km', 3, 'Les fourmis se sont adaptées à presque tous les milieux terrestres et souterrains mais pas aux milieux aquatiques et aux zones polaires.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 55),
     (197, 'fr', 'Héros de Star Wars', 'Sénatrice de Naboo au Sénat galactique, combien Padmé Amidala eut-elle d''enfants ?','Trois',  'Deux',  'Quatre', 'Cinq', 2, 'Amoureuse d''Anakin Skywalker, Padmé donne naissance aux jumeaux Luke Skywalker et Leia Organa avant de mourir.', 'https://fr.wikipedia.org/wiki/Padmé_Amidala', 6, 2, '2020-09-18 21:10:50.252078', NULL, 197),
     (198, 'fr', 'Héros de Star Wars', 'À qui Dark Vador a-t-il tranché la main droite dans l''épisode V de  Star Wars  ?', 'Luke', 'Obi-Wan', 'Han Solo', 'Mace Windu', 2, 'Dark Vador proposera à Luke de devenir son allié afin de renverser l''Empereur pour régner  comme père et fils .', 'https://fr.wikipedia.org/wiki/Anakin_Skywalker', 6, 2, '2020-09-18 21:10:50.252078', NULL, 198),
     (199, 'fr', 'Héros de Star Wars', 'Quel est le prénom du fils cloné de Jango Fett, célèbre chasseur de primes ?','Owen', 'Shmi', 'Dooku',  'Boba',  2, 'Boba est le seul clone non modifié et est élevé par Jango pour apprendre les techniques Mandaloriennes.', 'https://fr.wikipedia.org/wiki/Boba_Fett', 6, 2, '2020-09-18 21:10:50.252078', NULL, 199),
     (200, 'fr', 'Héros de Star Wars', 'Quel Gungan vivant dans la cité sous-marine d''Otoh Gunga a été exilé par Boss Nass ?', 'Jar Jar Binks', 'Watto', 'Lando Calrissian', 'Chewbacca', 2, 'Le personnage et le nom de Jar Jar Binks est une idée de Jett, le jeune fils de George Lucas.', 'https://fr.wikipedia.org/wiki/Jar_Jar_Binks', 6, 2, '2020-09-18 21:10:50.252078', NULL, 200),
     (201, 'fr', 'Héros de Star Wars', 'Après avoir imposé le respect auprès des maîtres Jedi, à quel âge Yoda est-il mort ?', '900 ans', '2 200 ans', '1 200 ans', '750 ans', 3, 'Les yeux de Yoda ont été repris sur ceux d''Albert Einstein pour, d''après George Lucas, lui donner un air intelligent et sage.', 'https://fr.wikipedia.org/wiki/Yoda', 6, 3, '2020-09-18 21:10:50.252078', NULL, 201),
     (202, 'fr', 'Héros de Star Wars', 'Dans le premier épisode, qui est le concurrent d''Anakin lors de la course de modules ?', 'Ben Quadinaros', 'Sebulba',  'Lama Su', 'Bultar Swan', 3, 'Avaricieux et très mauvais perdant, Sebulba est l''un des plus fameux pilote de module de course de la galaxie.', 'https://fr.wikipedia.org/wiki/Liste_des_personnages_de_Star_Wars', 6, 3, '2020-09-18 21:10:50.252078', NULL, 202),
     (203, 'fr', 'Héros de Star Wars', 'Quel est le prénom de la mère d''Anakin Skywalker, qui deviendra Dark Vador ?', 'Boba', 'Shmi', 'Cordé', 'Padmé', 3, 'George Lucas a choisi son prénom à partir de Lakshmi, une déesse hindoue.', 'https://fr.wikipedia.org/wiki/Anakin Skywalker', 6, 3, '2020-09-18 21:10:50.252078', NULL, 203),
     (204, 'fr', 'Héros de Star Wars', 'Quel ordre Palpatine a-t-il donné aux généraux de l''armée de clones dans l''épisode III ?','Ordre 88', 'Ordre 44', 'Ordre 22', 'Ordre 66',  3, 'La Grande Purge Jedi est un événement majeur de l''histoire de l''univers fictif de  Star Wars , imaginé par George Lucas.', 'https://fr.wikipedia.org/wiki/Grande_purge_Jedi', 6, 3, '2020-09-18 21:10:50.252078', NULL, 204),
     (205, 'fr', 'Héros de Star Wars', 'Quel est l''espèce du Vice roi de la Fédération du commerce Nute Gunray ?', 'Ortolan', 'Quarren', 'Nohgri','Neimoidien',  3, 'Les Neimoidiens sont des humanoïdes à la peau vert olive et grise, dont le visage possède un large nez aplati.', 'https://fr.wikipedia.org/wiki/Liste_des_espèces_de_Star_Wars', 6, 3, '2020-09-18 21:10:50.252078', NULL, 205),
     (206, 'fr', 'Héros de Star Wars', 'Apparu dans les épisodes II et III, comment le comte Dooku est-il également appelé ?', 'Dark Sidious', 'Dark Malak', 'Dark Tyranus', 'Dark Vador', 3, 'Le comte Dooku est interprété par Christopher Lee et doublé en version française par Bernard Dhéran.', 'https://fr.wikipedia.org/wiki/Comte_Dooku', 6, 3, '2020-09-18 21:10:50.252078', NULL, 206),
     (207, 'fr', 'Héros de Star Wars', 'Quel ferrailleur originaire de Toydaria fut l''ancien propriétaire d''Anakin et de sa mère ?','Plo Koon', 'Jango', 'Boss Nass',  'Watto',  3, 'Watto est intégralement généré par ordinateur par les équipes de modélisation d''Industrial Light et Magic.', 'https://fr.wikipedia.org/wiki/Watto', 6, 3, '2020-09-18 21:10:50.252078', NULL, 207),
     (208, 'fr', 'Héros de Star Wars', 'Quel autre nom est utilisé pour désigner Leia Amidala Skywalker, soeur de Luke ?', 'Leia Organa', 'Leia Amidala', 'Leia Windu', 'Leia Solo', 3, 'Leia et Luke bébés furent joués par le même nourrisson qui était le fils du monteur, Roger Barton.', 'https://fr.wikipedia.org/wiki/Leia_Organa', 6, 3, '2020-09-18 21:10:50.252078', NULL, 208),
     (209, 'fr', 'Héros de Star Wars', 'Quel personnage peut survivre dans le vide spatial sans appareil respiratoire ?', 'Plo Koon', 'Dark Bane', 'Han Solo', 'Watto', 3, 'Dernier Padawan instruit par Maître Tyvokka, Plo Koon est devenu Chevalier Jedi.', 'https://fr.wikipedia.org/wiki/Plo_Koon', 6, 3, '2020-09-18 21:10:50.252078', NULL, 209),
     (210, 'fr', 'Héros de Star Wars', 'Qui est considérée comme la femme Jedi la plus puissante de sa génération ?', 'Shaak Ti', 'Plo Koon', 'Leia Organa', 'Sebulba', 3, 'Shaak Ti fait partie du groupe des survivants secourus par Yoda et l''armée des clones.', 'https://fr.wikipedia.org/wiki/Shaak_Ti', 6, 3, '2020-09-18 21:10:50.252078', NULL, 210),
     (211, 'fr', 'Princesses Disney', 'Quelle fleur représentant l''amour est porteuse de mauvais sort dans  La Belle et la Bête  ?','Une tulipe', 'Un oeillet',  'Une rose', 'Une jonquille', 1, 'Bien que non mentionné dans le film, le jeune Prince, dont la devise est  Vainc qui se vainc , se prénomme Adam.', 'https://fr.wikipedia.org/wiki/La_Belle_et_la_Bête_(film,_1991)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 211),
     (212, 'fr', 'Princesses Disney', 'Passé minuit, en quoi le somptueux carrosse de Cendrillon se transforme-t-il ?', 'En gâteau', 'En citrouille',  'En pomme', 'En souris', 1, 'Cendrillon est une jeune femme soumise à l''autorité de sa marâtre, Lady Trémaine, et à celle de ses deux demi-soeurs.', 'https://fr.wikipedia.org/wiki/Cendrillon_(Disney)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 212),
     (213, 'fr', 'Princesses Disney', 'Quelle princesse de Disney peut-on entendre chanter  Siffler en travaillant  ? ', 'Blanche-Neige', 'Merida', 'Tiana', 'Pocahontas', 1, 'La version créée par les studios Disney diffère légèrement des autres adaptations du conte.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_(Disney)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 213),
     (214, 'fr', 'Princesses Disney', 'Combien de nains ont accueilli Blanche-Neige dans leur chaumière au fond des bois ?', 'Sept', 'Six', 'Cinq', 'Quatre', 1, ' Blanche-Neige et les Sept Nains  est le premier long-métrage d''animation Disney.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_et_les_Sept_Nains', 7, 1, '2020-09-18 21:59:37.49672', NULL, 214),
     (215, 'fr', 'Princesses Disney', 'Qui chante  Un jour, mon prince viendra  dans un dessin animé Disney ?', 'Blanche-Neige', 'Cendrillon', 'Alice', 'Jasmine', 1, 'Le film  Blanche-Neige  est une adaptation du conte éponyme des frères Grimm paru en 1812.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_et_les_Sept_Nains', 7, 1, '2020-09-18 21:59:37.49672', NULL, 215),
     (223, 'fr', 'Princesses Disney', 'Quelle princesse Disney est une sirène vivant auprès de son père, le roi Triton ?', 'Ariel', 'Jasmine', 'Tiana', 'Merida', 2, 'L''animateur Glen Keane aurait déclaré dans une conférence que l''apparence du personnage était fondée sur sa propre femme.', 'https://fr.wikipedia.org/wiki/Ariel_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 223),
     (224, 'fr', 'Princesses Disney', 'Dans le monde de Disney, quelle princesse chante  Ce rêve bleu  ?','Ariel', 'Merida', 'Tiana',  'Jasmine',  2, 'Jasmine est un personnage de fiction qui est apparu pour la première fois en 1992 dans le long métrage d''animation  Aladdin .', 'https://fr.wikipedia.org/wiki/Jasmine_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 224),
     (225, 'fr', 'Princesses Disney', 'Quelle princesse de Disney est célèbre pour sa longue chevelure blonde ?','Merida', 'Tiana', 'Raiponce',  'Ariel', 2, 'Si on coupe une mèche de cheveux de Raiponce, ceux-ci deviennent bruns et perdent leurs effets magiques.', 'https://fr.wikipedia.org/wiki/Raiponce_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 225),
     (226, 'fr', 'Princesses Disney', 'Quel film de Disney a réuni sur les écrans un pauvre voleur et une belle princesse ?', ' Aladdin ', ' Pocahontas ', ' Rebelle ', ' Raiponce ', 2, 'L''apparence de Jasmine fut inspirée de Jennifer Connelly mais également de la soeur de l''animateur du personnage.', 'https://fr.wikipedia.org/wiki/Jasmine_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 226),
     (227, 'fr', 'Princesses Disney', 'Qui a fabriqué la première robe de bal qu''a portée Cendrillon ?', 'Des souris', 'Des chouettes', 'Des enfants', 'Des sorcières', 2, 'Cendrillon est appelée ainsi car elle se repose dans la cendre une fois le travail terminé.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 2, '2020-09-18 21:59:37.49672', NULL, 227),
     (228, 'fr', 'Princesses Disney', 'Qui est Meeko dans  Pocahontas, une légende indienne  ?', 'Un raton-laveur', 'Un ours', 'Un oiseau', 'Un sanglier', 2, 'Disney a donné à Pocahontas les traits et la plastique du mannequin planétaire Naomi Campbell.', 'https://fr.wikipedia.org/wiki/Pocahontas_(film,_1995)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 228),
     (230, 'fr', 'Princesses Disney', 'Quelle première princesse afro-américaine a été mise en scène par Disney ?', 'Aurore', 'Tiana', 'Ariel', 'Jasmine', 2, 'Disney revient ici sur sa décision de ne pourtant plus réaliser des films en deux dimensions.', 'https://fr.wikipedia.org/wiki/La_Princesse_et_la_Grenouille', 7, 2, '2020-09-18 21:59:37.49672', NULL, 230),
     (231, 'fr', 'Princesses Disney', 'Quelle princesse Disney est savamment entraînée aux arts martiaux ?', 'Merida', 'Ariel', 'Tiana', 'Mulan', 3, 'Le courage, la détermination et l''ingéniosité de Mulan l''aideront dans ses aventures à gagner le respect des autres.', 'https://fr.wikipedia.org/wiki/Fa_Mulan', 7, 3, '2020-09-18 21:59:37.49672', NULL, 231),
     (232, 'fr', 'Princesses Disney', 'Que recherchent les sept nains de Blanche-Neige dans leur mine ?', 'Du schiste', 'Des diamants',  'Du pétrole', 'Du charbon', 3, 'Dans le parc d''attractions Efteling, les nains vivent dans le Bois des contes, jouxtant le château de sa belle-mère.', 'https://fr.wikipedia.org/wiki/Blanche-Neige', 7, 3, '2020-09-18 21:59:37.49672', NULL, 232),
     (233, 'fr', 'Princesses Disney', 'En 2037, quel âge aura le célèbre dessin animé  Blanche-Neige  des studios Disney ?', '75 ans', '50 ans', '125 ans','100 ans',  3, 'Le budget de production, 1.48 million de dollars, marque un record historique pour l''époque.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_et_les_Sept_Nains', 7, 3, '2020-09-18 21:59:37.49672', NULL, 233),
     (234, 'fr', 'Princesses Disney', 'Quel est le prénom du chat de la belle-mère de Cendrillon ?','Belzébuth',  'Lucifer', 'Diabolo', 'Satan', 3, 'Lucifer est le chat de Lady Trémaine : fourbe et paresseux, il représente une menace pour Jack.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 3, '2020-09-18 21:59:37.49672', NULL, 234),
     (96, 'fr', 'Boissons sans alcool', 'Avec quoi les cafetières de la marque Senseo fonctionnent-elles ?', 'Du café soluble',  'Des dosettes', 'Des capsules', 'Du café filtre', 1, 'La marque de cafetière est portée en Europe par les entreprises néerlandaises Philips et Jacobs Douwe Egberts.', 'https://fr.wikipedia.org/wiki/Senseo', 3, 1, '2020-09-18 14:48:09.520789', NULL, 96),
     (97, 'fr', 'Boissons sans alcool', 'Dans quel domaine la société Tropicana est-elle un des leaders mondiaux du marché ?', 'Jus de fruits', 'Thé', 'Limonade', 'Bières sans alcool', 1, 'L''entreprise a été fondée en 1947 par Anthony T. Rossi, un immigrant italien, avec à l''origine 50 employés.', 'https://fr.wikipedia.org/wiki/Tropicana', 3, 1, '2020-09-18 14:48:09.520789', NULL, 97),
     (98, 'fr', 'Boissons sans alcool', 'En 2014, quelle star française est apparue avec George Clooney dans une publicité Nespresso ?', 'Jean Dujardin', 'Omar Sy', 'Alain Delon', 'Jean-Paul Belmondo', 1, 'Via ces stars, la marque cherche à ne pas correspondre au modèle de vente d'' un produit dans une boite .', 'https://fr.wikipedia.org/wiki/Nespresso', 3, 1, '2020-09-18 14:48:09.520789', NULL, 98),
     (99, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne désigne pas une marque d''eau minérale ?', 'Tropicana', 'Badoit', 'Quézac', 'Saint-Yorre', 1, 'Après pressage, les fruits, transformés en jus, sont embouteillés selon la certification ISO 14001.', 'https://fr.wikipedia.org/wiki/Tropicana', 3, 1, '2020-09-18 14:48:09.520789', NULL, 99),
     (100, 'fr', 'Boissons sans alcool', 'Parmi ces différentes marques de sirops se cache un intrus, mais lequel ?', 'Champomy', 'Teisseire', 'Marie Dolin', 'Williams', 1, 'Champomy est créée en 1989 par Pampryl et est présentée comme  la première boisson festive pour enfants .', 'https://fr.wikipedia.org/wiki/Champomy', 3, 1, '2020-09-18 14:48:09.520789', NULL, 100),
     (101, 'fr', 'Boissons sans alcool', 'En 2009, quelle eau minérale a produit une publicité où des bébés faisaient du roller ?', 'Badoit', 'Volvic', 'Rozana', 'Evian', 2, 'Sa source se situe dans les Alpes à Évian-les-Bains dans le département de la Haute-Savoie.', 'https://fr.wikipedia.org/wiki/Évian_(eau_minérale)', 3, 2, '2020-09-18 15:07:46.091152', NULL, 101),
     (102, 'fr', 'Boissons sans alcool', 'Quelle marque de boissons énergisantes a pour logo trois griffes vertes ?', 'Monster Energy', 'Rockstar', 'Red Bull', 'Dark Dog', 2, 'La gamme comporte des boissons gazeuses énergétiques aux divers arômes fruités et des boissons non gazeuses à base de thé.', 'https://fr.wikipedia.org/wiki/Monster_Energy', 3, 2, '2020-09-18 15:07:46.091152', NULL, 102),
     (103, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne désigne pas un cocktail sans alcool ?', 'Lassi sucré', 'Arnold Palmer', 'Fauxmosa',  'Bloody Mary', 2, 'Le Bloody Mary est un cocktail plus ou moins fortement pimenté et épicé selon les goûts, à base de vodka.', 'https://fr.wikipedia.org/wiki/Bloody_Mary', 3, 2, '2020-09-18 15:07:46.091152', NULL, 103),
     (104, 'fr', 'Boissons sans alcool', 'Quelle société a créé la marque de café Ricoré, café soluble avec de la chicorée ?',  'Carrefour', 'Nestlé', 'Danone', 'Starbucks', 2, 'La marque est principalement présente en France et dans une moindre mesure en Belgique et en Pologne.', 'https://fr.wikipedia.org/wiki/Ricoré', 3, 2, '2020-09-18 15:07:46.091152', NULL, 104),
     (105, 'fr', 'Boissons sans alcool', 'Les couleurs du logo de la marque de café Carte Noire sont le noir, l''or et...', 'Le blanc', 'Le rouge', 'Le bleu', 'Le vert', 2, 'Le café est torréfié en France au sein d''une usine qui produit également les cafés Jacques Vabre et Café Grand Mère.', 'https://fr.wikipedia.org/wiki/Carte_Noire', 3, 2, '2020-09-18 15:07:46.091152', NULL, 105),
     (235, 'fr', 'Princesses Disney', 'Dans  Mulan , quel est le nom du dragon, le gardien de la famille ?', 'Mushu', 'Yao', 'Shang', 'Général Li', 3, 'C''est Eddie Murphy qui campe la voix originale de Mushu, tandis que la voix française est assurée par José Garcia.', 'https://fr.wikipedia.org/wiki/Mulan', 7, 3, '2020-09-18 21:59:37.49672', NULL, 235),
     (236, 'fr', 'Princesses Disney', 'Pour Disney, qui est Rajah, animal de compagnie de la princesse Jasmine ?', 'Un tigre', 'Un raton-laveur', 'Un sanglier', 'Un oiseau', 3, 'Jasmine et Aladdin sont apparus en 2002 dans une bande-annonce du film  Lilo et Stitch .', 'https://fr.wikipedia.org/wiki/Jasmine_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 236),
     (237, 'fr', 'Princesses Disney', 'Dans  Cendrillon , quels animaux sont transformés en chevaux de trait ?', 'Oies', 'Moutons',  'Souris', 'Lapins', 3, 'La composition des pantoufles de Cendrillon fait l''objet d''un débat récurrent en Europe.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 3, '2020-09-18 21:59:37.49672', NULL, 237),
     (238, 'fr', 'Princesses Disney', 'La plastique de quelle mannequin a servi à créer les principaux traits de Pocahontas ?', 'Naomi Campbell', 'Kelly Brook', 'Katie Price', 'Sienna Miller', 3, 'Le personnage de Pocahontas s''inspire librement du personnage historique Matoaka ( Petite plume de neige ).', 'https://fr.wikipedia.org/wiki/Pocahontas_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 238),
     (239, 'fr', 'Princesses Disney', 'Quelle princesse Disney communique librement avec la nature et les animaux ?', 'Mulan', 'Merida', 'Tiana', 'Pocahontas',  3, 'Les scénaristes du film ont inventé une Pocahontas écologiste, volontaire et physiquement attirante.', 'https://fr.wikipedia.org/wiki/Pocahontas_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 239),
     (240, 'fr', 'Princesses Disney', 'Laquelle de ces princesses est très souvent représentée dans sa robe de bal jaune or ?', 'Mulan','Belle',  'Tiana', 'Merida', 3, 'Depuis 2011, Belle est l''un des personnages principaux de la série télévisée  Once Upon a Time .', 'https://fr.wikipedia.org/wiki/Belle_(Disney)', 7, 3, '2020-09-18 21:59:37.49672', NULL, 240),
     (241, 'fr', 'Télé-réalité', 'Quel est le prénom du célèbre fiancé de Nabilla, personnalité médiatique franco-suisse ?', 'Thomas', 'Matthieu', 'Vincent', 'Michaël', 1, 'En novembre 2013, Nabilla Benattia est devenue vedette de sa propre émission de téléréalité,  Allô Nabilla .', 'https://fr.wikipedia.org/wiki/Nabilla_Benattia', 8, 1, '2020-09-18 22:29:31.15674', NULL, 241),
     (242, 'fr', 'Télé-réalité', 'De quelle émission de télé-réalité diffusée en 2001 Loana est-elle sortie grande gagnante ?', ' Loft Story ', ' Secret Story ', ' Nice People ', ' Bachelor ', 1, 'La renommée de Loana lui a permis de s''essayer aux métiers de styliste, chanteuse et présentatrice de télévision française.', 'https://fr.wikipedia.org/wiki/Loana_Petrucciani', 8, 1, '2020-09-18 22:29:31.15674', NULL, 242),
     (243, 'fr', 'Télé-réalité', 'Dans quelle émission Denis Brogniart met-il les candidats à rude épreuve en milieu hostile ?', ' Dropped ', ' Koh-Lanta ', ' Pékin Express ', ' Amazing Race ', 1, 'L''émission  Koh-Lanta  fut d''abord présentée par Hubert Auriol, puis ensuite par Denis Brogniart à partir de 2002.', 'https://fr.wikipedia.org/wiki/Koh-Lanta', 8, 1, '2020-09-18 22:29:31.15674', NULL, 243),
     (244, 'fr', 'Télé-réalité', 'Qui a remporté la toute première édition de la  Star Academy , présentée par Nikos sur TF1 ?','Mario', 'Nolwenn', 'Emma', 'Jenifer',  1, 'Jenifer est également connue pour avoir fait partie du jury français des quatre premières saisons de  The Voice .', 'https://fr.wikipedia.org/wiki/Jenifer', 8, 1, '2020-09-18 22:29:31.15674', NULL, 244),
     (245, 'fr', 'Télé-réalité', 'Quel beau gosse de la télé s''est fait passer pour  Greg le millionnaire  en 2003 ?', 'Grégory Basso', 'Grégory Lemarchal', 'Grégory Peck', 'Grégory Fitoussi', 1, 'Cette émission met en scène un faux millionnaire courtisé par vingt prétendantes ignorant tout de son passé et de sa vraie vie.', 'https://fr.wikipedia.org/wiki/Greg_le_millionnaire', 8, 1, '2020-09-18 22:29:31.15674', NULL, 245),
     (246, 'fr', 'Télé-réalité', 'Quelle a été la première émission de télé-réalité diffusée en France ?', ' Loft Story ', ' Nice People ', ' La Ferme Célébrités ', ' Incroyable talent ', 1, 'La production de l''émission a coûté entre 80 et 150 millions, le bénéfice de l''opération a avoisiné les 200 millions de francs français.', 'https://fr.wikipedia.org/wiki/Loft_Story_(France)', 8, 1, '2020-09-18 22:29:31.15674', NULL, 246),
     (247, 'fr', 'Télé-réalité', 'Qui a présenté avec panache la désormais célèbre  Star Academy  sur TF1 de 2001 à 2008 ?', 'Nikos Aliagas', 'Arthur', 'Cauet', 'Jean-Pierre Foucault', 1, 'Le 29 novembre 2012, Nikos Aliagas et sa compagne Tina Grigoriou ont donné naissance à une petite Agathe.', 'https://fr.wikipedia.org/wiki/Nikos_Aliagas', 8, 1, '2020-09-18 22:29:31.15674', NULL, 247),
     (248, 'fr', 'Télé-réalité', 'Laquelle de ces émissions de télé-réalité possède un oeil dans son logo ?', ' Secret Story ', ' Master Chef ', ' Dilemme ', ' Nice People ', 1, ' Secret Story  reprend plus ou moins les principes de base de  Big Brother , émission de télé réalité allemande créée en 1997.', 'https://fr.wikipedia.org/wiki/Secret_Story', 8, 1, '2020-09-18 22:29:31.15674', NULL, 248),
     (249, 'fr', 'Télé-réalité', 'Laquelle de ces émissions de télé-réalité est exclusivement consacrée à la cuisine ?', ' MasterChef ', ' X-Factor ', ' Koh-Lanta ', ' Dropped ', 1, ' MasterChef  est une émission de télé-réalité produite à l''origine au Royaume-Uni et déclinée depuis dans de multiples pays.', 'https://fr.wikipedia.org/wiki/MasterChef', 8, 1, '2020-09-18 22:29:31.15674', NULL, 249),
     (250, 'fr', 'Télé-réalité', 'Quelle émission de télé-réalité a donné naissance à l''émission  Les Marseillais  ?', ' Secret Story ', ' Les Ch''tis ', ' Nouvelle Star ', ' Dilemme ', 1, 'L''émission de télé-réalité  Les Marseillais  a accumulé depuis sa première saison soixante millions de téléspectateurs en France.', 'https://fr.wikipedia.org/wiki/Les_Ch''tis', 8, 1, '2020-09-18 22:29:31.15674', NULL, 250),
     (251, 'fr', 'Télé-réalité', 'Qui a présenté l''émission  Pékin Express  durant onze saisons consécutives ?', 'Stéphane Rotenberg', 'Philippe Etchebest', 'Stéphane Plaza', 'Thomas Sotto', 2, 'Le jeu télévisé  Pékin Express  s''apparente un peu à l''émission de télé-réalité américaine  The Amazing Race .', 'https://fr.wikipedia.org/wiki/Pékin_Express', 8, 2, '2020-09-18 22:29:31.15674', NULL, 251),
     (252, 'fr', 'Télé-réalité', 'Quel est le point commun entre les L5, M. Pokora et Sheryfa Luna ?', ' Popstars ', ' Star Academy ', ' Nouvelle Star ', ' X-Factor ', 2, 'Sheryfa Luna est la seule artiste de RnB français à avoir obtenu deux numéro un consécutifs au top single français.', 'https://fr.wikipedia.org/wiki/Sheryfa_Luna', 8, 2, '2020-09-18 22:29:31.15674', NULL, 252),
     (253, 'fr', 'Télé-réalité', 'Quelle est la nationalité de Serena, gagnante de l''unique saison de l''émission  Nice People  ?', 'Suisse',  'Italienne','Belge', 'Espagnole', 2, 'Serena Reinaldi a fait ses débuts au cinéma dans  Les Bronzés 3, amis pour la vie , réalisé par Patrice Leconte.', 'https://fr.wikipedia.org/wiki/Nice_People', 8, 2, '2020-09-18 22:29:31.15674', NULL, 253),
     (254, 'fr', 'Télé-réalité', 'Quelle émission de télé-réalité diffusée sur W9 a été remportée par Jean-Charles ?', ' Dilemme ', ' Option ', ' Alternative ', ' Problème ', 2, 'Endemol intenta en 2011 un procès à ALJ Prod au motif d''une copie illégale de son émission  Secret Story .', 'https://fr.wikipedia.org/wiki/Dilemme_(émission_de_télévision)', 8, 2, '2020-09-18 22:29:31.15674', NULL, 254),
     (255, 'fr', 'Télé-réalité', 'Quel membre du jury de la  Nouvelle Star  est présent depuis le tout début de l''émission ?', 'Dove Attia',  'André Manoukian', 'Philippe Manoeuvre', 'Marianne James', 2, ' Nouvelle Star  est basée sur le format à succès  Pop Idol  et produite par FremantleMedia et 19TV Ltd.', 'https://fr.wikipedia.org/wiki/Nouvelle_Star', 8, 2, '2020-09-18 22:29:31.15674', NULL, 255),
     (260, 'fr', 'Télé-réalité', 'Dans quelle émission de télé-réalité a-t-on pu retrouver un gentleman célibataire ?', ' Bachelor ', ' Les Colocataires ', ' Opération Séduction ', ' Dilemme ', 2, ' Bachelor, le gentleman célibataire  est une adaptation du programme  The Bachelor  diffusé sur la chaîne américaine ABC.', 'https://fr.wikipedia.org/wiki/Bachelor,_le_gentleman_célibataire', 8, 2, '2020-09-18 22:29:31.15674', NULL, 260),
     (261, 'fr', 'Télé-réalité', 'Depuis quelle saison des  Anges de la télé-réalité  Nabilla est-elle apparue ?', 'Saison 4', 'Saison 3', 'Saison 2', 'Saison 5', 3, 'Après Los Angeles, Miami et New York, c''est à Hawaï, aux États-Unis, que l''émission  Les Anges de la télé-réalité  s''est déroulée.', 'https://fr.wikipedia.org/wiki/Nabilla_Benattia', 8, 3, '2020-09-18 22:29:31.15674', NULL, 261),
     (262, 'fr', 'Télé-réalité', 'Combien y a-t-il eu d''éditions de la  Star Academy  en France ?', 'Neuf', 'Huit', 'Sept', 'Six', 3, 'Lors des sept premières saisons, les élèves de la  Star Academy  logeaient dans le Château des Vives Eaux situé à Dammarie-les-Lys.', 'https://fr.wikipedia.org/wiki/Star_Academy_(France)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 262),
     (263, 'fr', 'Télé-réalité', 'Quelle télé-réalité d''enfermement diffusée sur M6 a été remportée par Sébastien ?',  ' Dilemme ', ' Les Colocataires ', ' Loft Story ', ' Nice People ', 3, 'Les audiences globalement décevantes ont été attribuées notamment à la trop forte ressemblance avec  Loft Story .', 'https://fr.wikipedia.org/wiki/Les_Colocataires_(télé-réalité)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 263),
     (264, 'fr', 'Télé-réalité', 'Qui a remporté en 2005 l''émission de télé-réalité  Première compagnie  ?', 'Vincent Moscato',  'Nathalie Simon', 'Pascal Gentil', 'Jean Roucas', 3, 'L''émission était diffusée chaque soir en quotidienne depuis la Guyane à Sinnamary, et chaque vendredi soir depuis Paris.', 'https://fr.wikipedia.org/wiki/Première_Compagnie', 8, 3, '2020-09-18 22:29:31.15674', NULL, 264),
     (265, 'fr', 'Télé-réalité', 'Le secret d''Alexandra dans la saison 2 de  Secret Story  était :  Je suis... ', 'Une princesse', 'Prêtre anglicane', 'Croque-mort', 'Une médium', 3, 'De son vrai nom Marie-Alexandra Obolensky, dite Alexandra, est arrivée jusqu''en finale mais n''a pas remporté la compétition.', 'https://fr.wikipedia.org/wiki/Saison_2_de_Secret_Story', 8, 3, '2020-09-18 22:29:31.15674', NULL, 265),
     (266, 'fr', 'Télé-réalité', 'Quel jeu de télé-réalité était présenté en 2004 par Frédérique Courtadon ?', ' Les Colocataires ', ' Secret Story ', ' Bachelor ', ' Pékin Express ', 3, 'Il a fallu attendre l''été 2007 pour rencontrer une émission du même type :  Secret Story .', 'https://fr.wikipedia.org/wiki/Les_Colocataires_(télé-réalité)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 266),
     (267, 'fr', 'Télé-réalité', 'Quel ancien cycliste a remporté l''émission  Je suis une célébrité, sortez-moi de là!  ?', 'Richard Virenque', 'Laurent Jalabert', 'Bernard Hinault', 'Lance Armstrong', 3, 'Malgré un battage médiatique assez important, le jeu a reçu un accueil du public plus que mitigé.', 'https://fr.wikipedia.org/wiki/Je_suis_une_célébrité,_sortez-moi_de_là_!', 8, 3, '2020-09-18 22:29:31.15674', NULL, 267),
     (268, 'fr', 'Télé-réalité', 'Qui a présenté la deuxième saison de l''émission désormais culte  Mon incroyable fiancé  sur TF1 ?',  'Sandrine Quétier', 'Céline Catalaa', 'Elsa Fayer', 'Louise Bourgoin', 3, 'Pour la première saison, l''émission a réalisé un record d''audience absolu pour une deuxième partie de soirée.', 'https://fr.wikipedia.org/wiki/Mon_incroyable_fiancé', 8, 3, '2020-09-18 22:29:31.15674', NULL, 268),
     (269, 'fr', 'Télé-réalité', 'Qui fut la gagnante de l''émission  Top Model  diffusée en 2005 ?', 'Loana', 'Alizée', 'Karen', 'Adriana',  3, 'Cette émission de télé-réalité avait pour but de trouver un mannequin pour remplacer la célèbre Adriana Karembeu.', 'https://fr.wikipedia.org/wiki/Top_Model_(émission_de_télévision)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 269),
     (136, 'fr', 'Stades de Ligue 1', 'L''AS Nancy-Lorraine évolue dans un stade du nom de quel chapelier nancéen ?', 'Marcel Picot', 'Gaston Petit', 'Robert Diochon', 'André Flamart', 2, 'Le stade devait accueillir l''Euro 2016, avec un projet de modernisation portant sa capacité à 32 000 places assises.', 'https://fr.wikipedia.org/wiki/Stade_Marcel-Picot', 4, 2, '2020-09-18 16:10:43.098468', NULL, 136),
     (137, 'fr', 'Stades de Ligue 1', 'Le stade Auguste-Bonal est aussi vieux que le club qu''il accueille depuis 1931 et qui est ?', 'AJ Auxerre', 'FC Lorient', 'Tours FC','FC Sochaux', 2, 'Le stade porte depuis 1945 le nom d''Auguste Bonal, qui était un ancien dirigeant sochalien et qui fut tué par les Allemands.', 'https://fr.wikipedia.org/wiki/Stade_Auguste-Bonal', 4, 2, '2020-09-18 16:10:43.098468', NULL, 137),
     (138, 'fr', 'Stades de Ligue 1', 'Quel nouveau nom a-t-on donné en 2015 au stade de la route de Lorient ?', 'Roazhon Park', 'Breizh Stadium', 'Stade Gwenn-ha-Du', 'Stade du Ray', 2, 'Bordé par le paisible cours de la Vilaine, le Roazhon Park se trouve au centre des installations du Stade rennais FC.', 'https://fr.wikipedia.org/wiki/Roazhon_Park', 4, 2, '2020-09-18 16:10:43.098468', NULL, 138),
     (139, 'fr', 'Stades de Ligue 1', 'En 1978, le stade de la Vallée du Cher accompagna quel club ?', 'Tours FC', 'Angers SCO', 'Cannes', 'FC Lorient', 2, 'La première année, seule la première tranche du stade fut ouverte, offrant ainsi une capacité d''environ 8 000 places.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Vallée_du_Cher', 4, 2, '2020-09-18 16:10:43.098468', NULL, 139),
     (140, 'fr', 'Stades de Ligue 1', 'Quel est à ce jour le second stade de France de par sa capacité en nombre de supporters ?', 'Parc des Princes', 'Stade Vélodrome', 'Matmut-Atlantique', 'Allianz Riviera', 2, 'Juste avant la Coupe du monde de football de 1998, l''enceinte est passée à 60 000 places et n''a désormais plus de toit.', 'https://fr.wikipedia.org/wiki/Stade_Vélodrome', 4, 2, '2020-09-18 16:10:43.098468', NULL, 140),
     (141, 'fr', 'Stades de Ligue 1', 'L''Olympique lyonnais a quitté le stade Gerland pour quelle commune ?', 'Vaulx-en-Velin',  'Décines-Charpieu', 'Vénissieux', 'Villeurbanne', 3, 'Le stade de Gerland accueille désormais les matchs de l''équipe féminine depuis que le stade de Décines est opérationnel.', 'https://fr.wikipedia.org/wiki/Olympique_lyonnais', 4, 3, '2020-09-18 16:10:43.098468', NULL, 141),
     (142, 'fr', 'Stades de Ligue 1', 'Quel autre nom porte également le stade de la Beaujoire du FC Nantes ?', 'Jean Snaudeau', 'Marcel Saupin', 'Marcel Picot', 'Louis Fonteneau', 3, 'L''idée de construire un nouveau stade de football à Nantes sera lancée à la fin des années 1970 par Louis Fonteneau.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Beaujoire', 4, 3, '2020-09-18 16:10:43.098468', NULL, 142),
     (143, 'fr', 'Stades de Ligue 1', 'Où jouait l''OGC Nice avant d''utiliser l''Allianz Riviera depuis 2013 ?', 'Stade de La Bocca',  'Stade du Ray','Stade de Lorient', 'Stade Océane', 3, 'Le terme Ray correspond au nom du quartier où se trouve le stade qui a accueilli les matchs de l''OGC Nice de 1927 à 2013.', 'https://fr.wikipedia.org/wiki/Stade_Léo-Lagrange_(Nice)', 4, 3, '2020-09-18 16:10:43.098468', NULL, 143),
     (144, 'fr', 'Stades de Ligue 1', 'Quel stade Le Mans FC a-t-il longtemps utilisé avant le MMArena ?', 'Stade Léon-Bollée', 'Stade de la Sarthe', 'Stade de Lorient', 'Stade Océane', 3, 'L''enceinte portait le nom d''une personnalité mancelle (Léon Bollée), fameux pionnier de la construction automobile du XIXe siècle.', 'https://fr.wikipedia.org/wiki/Stade_Léon-Bollée', 4, 3, '2020-09-18 16:10:43.098468', NULL, 144),
     (270, 'fr', 'Télé-réalité', 'Qui a été l''animateur des  Anges de la télé-réalité  jusqu''en 2015 ?', 'Sébastien Cauet', 'Pascal Soetens','Matthieu Delormeau',  'Adrien Rohard', 3, 'Le principe de l''émission est de faire cohabiter d''anciens candidats de télé-réalité française dans une grande villa.', 'https://fr.wikipedia.org/wiki/Les_Anges_(émission_de_télévision)', 8, 3, '2020-09-18 22:29:31.15674', NULL, 270),
     (176, 'fr', 'Réseaux sociaux', 'Quel réseau professionnel en ligne allemand revendique plusieurs millions de membres ?', ' XING ', ' Foursquare ', ' Viadeo ', ' Pinterest ', 3, 'Les réseaux sociaux comme  Facebook  ou  Myspace  ne sont pas considérés comme des concurrents directs.', 'https://fr.wikipedia.org/wiki/XING', 5, 3, '2020-09-18 18:20:46.777109', NULL, 176),
     (177, 'fr', 'Réseaux sociaux', 'Quelle application sociale est la plus populaire au Japon ?', ' Emoji ', ' LINE ', ' Viber ', ' Skype ', 3, 'La vente de produits dérivés, tels que les autocollants, jeux, figurines et peluches, constitue une partie significative des revenus de LINE.', 'https://fr.wikipedia.org/wiki/LINE_(logiciel)', 5, 3, '2020-09-18 18:20:46.777109', NULL, 177),
     (178, 'fr', 'Réseaux sociaux', 'Quel réseau social chinois récemment coté en bourse s''appelait autrefois  Xiaonei  ?', ' Renren ', ' Panguso ', ' NetEase ', ' Baidu ', 3, ' Xiaonei  a été créé en décembre 2005 par des étudiants de l''Université de Tsinghua, Wang Huiwen, Lai Binqiang et Jacky.', 'https://fr.wikipedia.org/wiki/Renren', 5, 3, '2020-09-18 18:20:46.777109', NULL, 178),
     (179, 'fr', 'Réseaux sociaux', 'Quel service de mise en relation d''annuaires sociaux vient du cofondateur de  Napster  ?', ' LinkedIn ', ' Pinterest ',' Plaxo ',  ' Viadeo ', 3, 'Après une perte brutale de notoriété entre 2007 et 2011,  Plaxo  a jeté l''éponge en 2011, fermant  Plaxo Pulse .', 'https://fr.wikipedia.org/wiki/Plaxo', 5, 3, '2020-09-18 18:20:46.777109', NULL, 179),
     (180, 'fr', 'Réseaux sociaux', 'Quel site Web de réseautage social russe a été racheté par un proche de Vladimir Poutine ?', ' Yammer ', ' Plaxo ',  ' VK ',' Soup ', 3, 'À sa création, le nom du site ne devait faire aucune allusion à certaines catégories sociales d''utilisateurs.', 'https://fr.wikipedia.org/wiki/VKontakte', 5, 3, '2020-09-18 18:20:46.777109', NULL, 180),
     (181, 'fr', 'Héros de Star Wars', 'Sur quelle planète désertique Anakin Skywalker est-il arrivé à l''âge de quatre ans ?', 'Naboo', 'Hoth', 'Endor', 'Tatooine', 1, 'George Lucas a utilisé l''habitat traditionnel de Tataouine sans retouches pour la scène où Anakin retourne voir sa mère.', 'https://fr.wikipedia.org/wiki/Tatooine', 6, 1, '2020-09-18 21:10:50.252078', NULL, 181),
     (182, 'fr', 'Héros de Star Wars', 'Quel légendaire guerrier Wookiee est depuis longtemps le fidèle compagnon d''Han Solo ?', 'Chewbacca', 'Palpatine', 'Watto', 'Jar Jar Binks', 1, 'Chewbacca possède un grand coeur et fait preuve d''une loyauté indéfectible envers ses amis.', 'https://fr.wikipedia.org/wiki/Chewbacca', 6, 1, '2020-09-18 21:10:50.252078', NULL, 182),
     (183, 'fr', 'Héros de Star Wars', 'Quel nom Obi-Wan Kenobi a-t-il adopté pendant des années jusqu''au jour où il rencontra Luke ?', 'Ben', 'Tom', 'Sid', 'Ken', 1, 'Le vieil Obi-Wan Kenobi met Luke Skywalker sur le chemin de la Force avant d''être tué volontairement par Dark Vador.', 'https://fr.wikipedia.org/wiki/Obi-Wan_Kenobi', 6, 1, '2020-09-18 21:10:50.252078', NULL, 183),
     (185, 'fr', 'Héros de Star Wars', 'Quel nom porte le robot qu''Anakin a construit à partir du corps d''un droïde de protocole ?', 'R2-D2',  'C-3PO', 'T-1000', 'Daryl', 1, 'Ce droïde protocolaire de forme humanoïde  maîtrise plus de six millions de formes de communication .', 'https://fr.wikipedia.org/wiki/C-3PO', 6, 1, '2020-09-18 21:10:50.252078', NULL, 185),
     (229, 'fr', 'Princesses Disney', 'Quelle princesse Disney ne quitte pour ainsi dire jamais son arc et ses flèches ?',  'Tiana', 'Ariel', 'Merida', 'Jasmine', 2, 'Merida est le personnage principal du long métrage d''animation  Rebelle , sorti en 2012.', 'https://fr.wikipedia.org/wiki/Mérida_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 229),
     (216, 'fr', 'Princesses Disney', 'De quelle manière le prince charmant réveille-t-il Blanche-Neige ?', 'Par une gifle', 'Par une morsure', 'Par un chant', 'Par un baiser', 1, 'La version la plus connue de  Blanche-Neige  est celle de Jacob et Wilhelm Grimm, parue en 1812.', 'https://fr.wikipedia.org/wiki/Blanche-Neige', 7, 1, '2020-09-18 21:59:37.49672', NULL, 216),
     (217, 'fr', 'Princesses Disney', 'Quelle célèbre princesse du grand écran est empoisonnée avec une pomme ?', 'Blanche-Neige', 'Cendrillon', 'Raiponce', 'Ariel', 1, 'Blanche-Neige est une princesse d''une très grande beauté, ce qui rend jalouse sa belle-mère, la Reine.', 'https://fr.wikipedia.org/wiki/Blanche-Neige_(Disney)', 7, 1, '2020-09-18 21:59:37.49672', NULL, 217),
     (218, 'fr', 'Princesses Disney', 'Quelle héroïne de Disney se voit refuser le droit de rester au bal après minuit ?', 'Alice', 'Blanche-Neige',  'Cendrillon','Aurore', 1, 'Certaines versions de Cendrillon peuvent être très différentes les unes des autres.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 1, '2020-09-18 21:59:37.49672', NULL, 218),
     (219, 'fr', 'Princesses Disney', 'À quelle heure les vêtements de Cendrillon redeviennent-ils ses haillons habituels ?', 'Minuit', 'Midi', 'Onze heures', 'Trois heures', 1, 'L''Occident connaît surtout l''histoire de Cendrillon au travers des versions de Charles Perrault.', 'https://fr.wikipedia.org/wiki/Cendrillon', 7, 1, '2020-09-18 21:59:37.49672', NULL, 219),
     (220, 'fr', 'Princesses Disney', 'Qui a été placée dans un cercueil de verre par des nains puis réveillée par un prince ?', 'Cendrillon', 'Esmeralda', 'Fiona', 'Blanche-Neige',  1, 'Blanche-Neige montre qu''il ne faut pas s''attacher à des choses éphémères telles la beauté et la jeunesse.', 'https://fr.wikipedia.org/wiki/Blanche-Neige', 7, 1, '2020-09-18 21:59:37.49672', NULL, 220),
     (221, 'fr', 'Princesses Disney', 'Quelle couleur est souvent associée à Aurore dans  La Belle au bois dormant  ?', 'Verte', 'Rose', 'Rouge', 'Bleue', 2, 'Le célèbre château de la princesse Aurore est utilisé dans les parcs de Disneyland comme icône de la zone Fantasyland.', 'https://fr.wikipedia.org/wiki/Aurore_(Disney)', 7, 2, '2020-09-18 21:59:37.49672', NULL, 221),
     (222, 'fr', 'Princesses Disney', 'Quelles aventures de Disney se déroulent dans le nord de la Chine ?', ' Pocahontas ', ' Mulan ', ' Raiponce ', ' Rebelle ', 2, 'Le caractère du personnage de Mulan est différent des classiques Disney, notamment de celui des princesses.', 'https://fr.wikipedia.org/wiki/Fa_Mulan', 7, 2, '2020-09-18 21:59:37.49672', NULL, 222),
     (256, 'fr', 'Télé-réalité', 'Avec qui Marjolaine s''affichait-elle dans une émission de télé-réalité diffusée en 2004 ?', 'Des fermiers', 'Des sportifs',  'Des millionnaires','Des animateurs', 2, 'Cette émission met en scène quinze faux millionnaires courtisant Marjolaine Bui, l''une des prétendantes de  Greg le millionnaire .', 'https://fr.wikipedia.org/wiki/Marjolaine_et_les_Millionnaires', 8, 2, '2020-09-18 22:29:31.15674', NULL, 256),
     (257, 'fr', 'Télé-réalité', 'Quelle chaîne de la TNT française a diffusé l''émission  Les Marseillais à Rio  ?', 'W9', 'NT1', 'D8', 'M6', 2, 'Le programme suit les aventures d''une douzaine de candidats issus de la région de Marseille et travaillant dans le monde de la nuit.', 'https://fr.wikipedia.org/wiki/Les_Marseillais', 8, 2, '2020-09-18 22:29:31.15674', NULL, 257),
     (258, 'fr', 'Télé-réalité', 'De quelle émission de télé-réalité Alexia Laroche-Joubert a-t-elle été la directrice ?', ' Star Academy ', ' Loft Story ', ' Secret Story ', ' Nice People ', 2, 'Alexia Laroche-Joubert est la fille de Patrick Laroche-Joubert, publicitaire, et de Martine Gabarra, grand reporter.', 'https://fr.wikipedia.org/wiki/Alexia_Laroche-Joubert', 8, 2, '2020-09-18 22:29:31.15674', NULL, 258),
     (259, 'fr', 'Télé-réalité', 'Quelle société française a produit l''émission de télé-réalité  Secret Story  ?', 'Endemol', 'Arcadis', 'Sofina', 'Tele Atlas', 2, ' Secret Story  se déroule chaque année en été et s''étend sur dix à quinze semaines.', 'https://fr.wikipedia.org/wiki/Secret_Story', 8, 2, '2020-09-18 22:29:31.15674', NULL, 259),
     (44, 'fr', 'Fourmis', 'Quel sexe aura obligatoirement une fourmi si son oeuf a la chance d''être fécondé ?','Mâle', 'Mâle ou femelle',  'Femelle', 'On ne sait pas', 2, 'Si l''oeuf est fécondé, l''individu est alors diploïde et l''oeuf donnera une femelle, s''il ne l''est pas, l''individu est haploïde et forme un mâle.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 44),
     (47, 'fr', 'Fourmis', 'Quelles fourmis à l''abdomen gonflé deviennent des mets délicieux en Australie ?', 'Pot-de-miel', 'Tisserandes', 'Charpentières', 'Moissonneuses', 2, 'Ces fourmis servent de réservoir vivant aux autres fourmis de la colonie qui viennent leur donner le miellat.', 'https://fr.wikipedia.org/wiki/Fourmi_pot-de-miel', 1, 2, '2020-09-17 11:13:40.552188', NULL, 47),
     (48, 'fr', 'Fourmis', 'Quels produits chimiques sont utilisés pour faciliter la communication entre les fourmis ?', 'Les phéromones', 'Les neurotoxiques', 'Les biocides', 'Les glucides', 2, 'Les phéromones agissent comme des messagers et jouent notamment un rôle dans l''attraction sexuelle.', 'https://fr.wikipedia.org/wiki/Phéromone', 1, 2, '2020-09-17 11:13:40.552188', NULL, 48),
     (49, 'fr', 'Fourmis', 'Quelles fourmis sont chargées d''éliminer les cadavres du nid ?', 'Les nettoyeuses', 'Les guérisseuses', 'Les ouvrières', 'Les guerrières', 2, 'Les nettoyeuses sont souvent des ouvrières en fin de vie ou des individus qui restent dans les endroits consacrés aux déchets.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 2, '2020-09-17 11:13:40.552188', NULL, 49),
     (50, 'fr', 'Fourmis', 'Quel prédateur est également nommé le fourmilier géant ou grand fourmilier ?', 'Le hurleur', 'Le tamanoir', 'Le ragondin', 'Le saphir', 2, 'Le tamanoir est surtout terrestre, contrairement à d''autres fourmiliers ou paresseux, qui sont arboricoles ou semi-arboricole.', 'https://fr.wikipedia.org/wiki/Tamanoir', 1, 2, '2020-09-17 11:13:40.552188', NULL, 50),
     (56, 'fr', 'Fourmis', 'Quel est le record de longévité détenu par une reine chez la fourmi noire des jardins ?', '28 ans', '25 ans', '22 ans', '19 ans', 3, 'Les mâles ont une vie très brève et, ne sachant pas s''alimenter seuls, ils meurent dès qu''ils se sont reproduits.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 56),
     (57, 'fr', 'Fourmis', 'Quel pourcentage des espèces de fourmis recensées dans le monde vivent sans reine ?', '11 %', '21 %', '31 %', '1 %',  3, 'Ces fourmis vivent au sein de colonies très réduites dans lesquelles certaines ouvrières se reproduisent.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 57),
     (58, 'fr', 'Fourmis', 'Quel terme utilise-t-on généralement pour désigner les sons émis par les fourmis ?','Percussions', 'Bourdonnements', 'Stridulations', 'Déformations', 3, 'La stridulation permet d''émettre une large gamme de signaux sonores (sélection sexuelle, territorialité, etc...).', 'https://fr.wikipedia.org/wiki/Stridulation', 1, 3, '2020-09-17 11:16:25.655314', NULL, 58),
     (59, 'fr', 'Fourmis', 'À combien de milliards d''individus estime-t-on le nombre de fourmis sur Terre ?', '7 millions', '10 millions', '4 millions', '1 million', 3, 'Les fourmis représenteraient 1 à 2 % du nombre d''espèces d''insectes, mais constitueraient près de 20 % de leur biomasse.', 'https://fr.wikipedia.org/wiki/Fourmi', 1, 3, '2020-09-17 11:16:25.655314', NULL, 59),
     (60, 'fr', 'Fourmis', 'Quel mammifère insectivore recouvert d''écailles est un prédateur pour les fourmis ?', 'Ragondin', 'Saphir', 'Tamanoir', 'Pangolin',3, 'Les pangolins peuplent les forêts et les savanes des régions tropicales et équatoriales d''Afrique et d''Asie du Sud-Est.', 'https://fr.wikipedia.org/wiki/Pangolin', 1, 3, '2020-09-17 11:16:25.655314', NULL, 60),
     (61, 'fr', 'Villes du monde', 'À quelle ville de France l''andouillette, le saucisson et Guignol vous font-ils penser ?', 'Lyon', 'Marseille', 'Nice', 'Cannes', 1, 'Lyon est en situation de carrefour géographique, au nord du couloir naturel de la vallée du Rhône.', 'https://fr.wikipedia.org/wiki/Lyon', 2, 1, '2020-09-17 11:19:41.273046', NULL, 61),
     (62, 'fr', 'Villes du monde', 'Quelle ville, capitale de la Grèce, comprend notamment le port du Pirée ?', 'Athènes', 'Patras', 'Larissa', 'Héraklion', 1, 'Athènes est l''une des plus anciennes villes au monde, avec une présence humaine attestée dès le Néolithique.', 'https://fr.wikipedia.org/wiki/Athènes', 2, 1, '2020-09-17 11:19:41.273046', NULL, 62),
     (63, 'fr', 'Villes du monde', 'De quelle ville du Sud-Ouest de la France proviennent de célèbres pruneaux AOC ?', 'Marmande', 'Tonneins',  'Agen', 'Nérac', 1, 'Le nom d''Agen est associé au pruneau, dont la zone de production principale est essentiellement située en Lot-et-Garonne.', 'https://fr.wikipedia.org/wiki/Agen', 2, 1, '2020-09-17 11:19:41.273046', NULL, 63),
     (64, 'fr', 'Villes du monde', 'De quelle couleur sont les cabines téléphoniques de la ville de Londres ?',  'Verte', 'Rouge', 'Jaune', 'Blanche', 1, 'Ville touristique européenne par excellence, Londres fut fondée il y a presque 2 000 ans par les Romains sous le nom de Londinium.', 'https://fr.wikipedia.org/wiki/Londres', 2, 1, '2020-09-17 11:19:41.273046', NULL, 64),
     (65, 'fr', 'Villes du monde', 'Quelle ville réputée pour la qualité de ses cigares est aussi la capitale de Cuba ?', 'La Havane', 'Santiago de Cuba', 'Guantanamo', 'Santa Clara', 1, 'L''emplacement actuel de la ville de La Havane se situe sur la côte nord de l''île de Cuba et dans la partie ouest de celle-ci.', 'https://fr.wikipedia.org/wiki/La_Havane', 2, 1, '2020-09-17 11:19:41.273046', NULL, 65),
     (66, 'fr', 'Villes du monde', 'À la fois ville et province, de quel pays Bangkok est-elle la capitale ?', 'Thaïlande', 'Malaisie', 'Birmanie', 'Laos', 1, 'Le boom économique asiatique des années 1980-1990 a amené de nombreuses multinationales à rapidement s''installer à Bangkok.', 'https://fr.wikipedia.org/wiki/Bangkok', 2, 1, '2020-09-17 11:19:41.273046', NULL, 66),
     (67, 'fr', 'Villes du monde', 'À quelle grande ville d''Afrique l''explorateur Savorgnan de Brazza a-t-il donné son nom ?','Kinshasa', 'Libreville', 'Nairobi',  'Brazzaville', 1, 'La ville de Brazzaville a été fondée le 3 octobre 1880 à l''emplacement des anciens bourgs précoloniaux de Nkuna.', 'https://fr.wikipedia.org/wiki/Brazzaville', 2, 1, '2020-09-17 11:19:41.273046', NULL, 67),
     (68, 'fr', 'Villes du monde', 'Quelle capitale est également le centre politique et culturel de la Chine ?', 'Pékin', 'Shanghai', 'Hong Kong', 'Tokyo', 1, 'Située à proximité de la Grande Muraille, Pékin abrite des monuments célèbres comme la Cité interdite et le Temple du ciel.', 'https://fr.wikipedia.org/wiki/Pékin', 2, 1, '2020-09-17 11:19:41.273046', NULL, 68),
     (69, 'fr', 'Villes du monde', 'Laquelle de ces quatre villes espagnoles ne possède pas un port de renom ?', 'Madrid', 'Barcelone', 'Malaga', 'Valence', 1, 'Située en plein coeur du royaume d''Espagne, Madrid est la capitale mais aussi la ville la plus peuplée de la Communauté de Madrid.', 'https://fr.wikipedia.org/wiki/Liste_des_ports_en_Espagne', 2, 1, '2020-09-17 11:19:41.273046', NULL, 69),
     (70, 'fr', 'Villes du monde', 'Dans quel pays à forte densité de population la ville de Calcutta est-elle située ?','Brésil', 'Inde', 'Bangladesh', 'Birmanie', 1, 'Calcutta est connue pour avoir abrité la fondation de la congrégation religieuse des Missionnaires de la Charité par Mère Teresa.', 'https://fr.wikipedia.org/wiki/Calcutta', 2, 1, '2020-09-17 11:19:41.273046', NULL, 70),
     (71, 'fr', 'Villes du monde', 'Quelle est la capitale ainsi que la plus grande ville du territoire égyptien ?', 'Alexandrie', 'Louxor', 'Suez', 'Le Caire', 2, 'Avec ses seize millions d\habitants, Le Caire est la plus grande ville du Moyen-Orient et la seconde ville d''Afrique derrière Lagos.', 'https://fr.wikipedia.org/wiki/Le_Caire', 2, 2, '2020-09-17 11:24:13.752782', NULL, 71),
     (72, 'fr', 'Villes du monde', 'Célèbre pour son industrie cinématographique, dans quel pays se situe la ville de Bombay ?', 'Népal', 'Inde', 'Pakistan', 'Sri Lanka', 2, 'Bombay forme avec les villes de Navi Mumbai, Bhiwandi, Kalyan, Ulhasnagar et Thane une agglomération de 18 500 000 habitants.', 'https://fr.wikipedia.org/wiki/Bombay', 2, 2, '2020-09-17 11:24:13.752782', NULL, 72),
     (73, 'fr', 'Villes du monde', 'Dans laquelle de ces villes peut-on contempler un célèbre pain de sucre ?', 'Brazzaville', 'La Havane','Rio de Janeiro', 'Le Caire', 2, 'Le Christ Rédempteur est une immense statue du Christ dominant la ville de Rio de Janeiro, surplombant le mont du Corcovado.', 'https://fr.wikipedia.org/wiki/Christ_Rédempteur', 2, 2, '2020-09-17 11:24:13.752782', NULL, 73),
     (74, 'fr', 'Villes du monde', 'Quelle capitale administrative des Pays-Bas est le siège de nombreuses institutions ?', 'La Haye', 'Amsterdam', 'Rotterdam', 'Utrecht', 2, 'La Haye est également la ville où siègent la Cour internationale de justice, la Cour pénale internationale, Europol et Eurojust.', 'https://fr.wikipedia.org/wiki/La_Haye', 2, 2, '2020-09-17 11:24:13.752782', NULL, 74),
     (75, 'fr', 'Villes du monde', 'Combien y a-t-il de communes à Paris situées sur une boucle de la Seine ?', 'Une seule', '9', '13', '22', 2, 'D''après le recensement de l''Insee, la commune de Paris comptait au 1er janvier 2012 plus de deux millions d''habitants.', 'https://fr.wikipedia.org/wiki/Paris', 2, 2, '2020-09-17 11:24:13.752782', NULL, 75),
     (76, 'fr', 'Villes du monde', 'Tripoli est une ville du Liban mais se trouve être aussi la capitale de quel pays ?',  'Maroc', 'Soudan', 'Tunisie','Libye', 2, 'Tripoli est la plus grande ville, le principal port et le plus grand centre industriel, commercial et touristique de Libye.', 'https://fr.wikipedia.org/wiki/Tripoli_(Libye)', 2, 2, '2020-09-17 11:24:13.752782', NULL, 76),
     (77, 'fr', 'Villes du monde', 'Quelle ville est aussi importante pour l''Afrique que pour le monde arabe ?', 'Assouan', 'Le Caire', 'Alexandrie', 'Suez', 2, 'Centre névralgique de la ville moderne, la place Tahrir est devenue pour la planète l''emblème de la révolution égyptienne de 2011.', 'https://fr.wikipedia.org/wiki/Le_Caire', 2, 2, '2020-09-17 11:24:13.752782', NULL, 77),
     (78, 'fr', 'Villes du monde', 'Avec ses nombreux canaux, sur les rives de quelle mer la ville de Venise est-elle située ?', 'Adriatique', 'Égée', 'Ionienne', 'Noire', 2, 'Menacée par le climat, Venise s''étend sur un ensemble de 118 petites îles séparées par un réseau de canaux et reliées par des ponts.', 'https://fr.wikipedia.org/wiki/Venise', 2, 2, '2020-09-17 11:24:13.752782', NULL, 78),
     (79, 'fr', 'Villes du monde', 'Dans quelle ville recense-t-on à ce jour le plus grand nombre de taxis au monde ?', 'New York', 'Londres', 'Tokyo', 'Brasilia', 2, 'Les célèbres taxis jaunes sont exploités par des sociétés privées, agréées par la Commission de Taxi et Limousine de New York.', 'https://fr.wikipedia.org/wiki/Taxis_de_New_York', 2, 2, '2020-09-17 11:24:13.752782', NULL, 79),
     (80, 'fr', 'Villes du monde', 'Quelle capitale du Népal était une étape bien connue de la communauté hippies ?', 'Katmandou', 'Pokhara', 'Lalitpur', 'Dharan', 2, 'Katmandou ne possède pas de réseau souterrain de canalisations et dispose dès lors d''une alimentation en eau insuffisante.', 'https://fr.wikipedia.org/wiki/Katmandou', 2, 2, '2020-09-17 11:24:13.752782', NULL, 80),
     (81, 'fr', 'Villes du monde', 'Au bord de quoi la ville américaine de Chicago a-t-elle été construite ?', 'Lac', 'Océan', 'Volcan', 'Faille', 3, 'La ville de Chicago, qui constitue le deuxième centre industriel des États-Unis, appartient à la Ceinture des industries.', 'https://fr.wikipedia.org/wiki/Chicago', 2, 3, '2020-09-17 11:32:06.434555', NULL, 81),
     (82, 'fr', 'Villes du monde', 'Quelle est la nationalité des habitants de Taïwan, aussi appelée Formose ?', 'Japonaise', 'Coréenne','Chinoise', 'Népalaise', 3, 'Le climat de Taïwan est tropical au sud et subtropical humide au nord : les étés y sont chauds et les hivers relativement doux.', 'https://fr.wikipedia.org/wiki/Taïwan_(île)', 2, 3, '2020-09-17 11:32:06.434555', NULL, 82),
     (83, 'fr', 'Villes du monde', 'Combien y a-t-il environ d''habitants à Mexico, capitale et ville la plus peuplée du Mexique ?', '16 millions', '12 millions', '20 millions','8 millions', 3, 'L''aire urbaine de Mexico, recensée comme la troisième plus peuplée du monde, s''étale sur une surface de 60 km sur 100 km environ.', 'https://fr.wikipedia.org/wiki/Mexico', 2, 3, '2020-09-17 11:32:06.434555', NULL, 83),
     (84, 'fr', 'Villes du monde', 'Dans quelle région historique d''Espagne se situe la célèbre ville de Barcelone ?',  'Andalousie', 'Castille', 'Galice','Catalogne', 3, 'Barcelone est la deuxième ville d''Espagne en termes de population, d''économie et d''activités et la onzième la plus peuplée de l''UE.', 'https://fr.wikipedia.org/wiki/Barcelone', 2, 3, '2020-09-17 11:32:06.434555', NULL, 84),
     (85, 'fr', 'Villes du monde', 'Comment appelle-t-on le quartier arabe ou la médina d''Alger ?', 'Bled', 'Casbah', 'Souk', 'Torah', 3, 'L''histoire de la Casbah d''Alger remonte à l''Antiquité, où elle fut d''abord un port punique, puis berbère et enfin romain.', 'https://fr.wikipedia.org/wiki/Casbah_d''Alger', 2, 3, '2020-09-17 11:32:06.434555', NULL, 85),
     (86, 'fr', 'Villes du monde', 'De quel pays Rangoun est-elle la plus grande ville en nombre d''habitants ?', 'Birmanie', 'Laos', 'Malaisie', 'Philippines', 3, 'Le nom de la capitale du pays (Rangoon/Rangoun) peut être traduit comme fin de la discorde ou fin du conflit.', 'https://fr.wikipedia.org/wiki/Rangoun', 2, 3, '2020-09-17 11:32:06.434555', NULL, 86),
     (87, 'fr', 'Villes du monde', 'Dans quel pays se trouve Hammerfest, la ville la plus au nord de l''Europe ?', 'Norvège', 'Suède', 'Finlande', 'Écosse', 3, 'Située dans le comté de Finnmark, on dit souvent d''Hammerfest qu''elle est la ville la plus septentrionale du monde.', 'https://fr.wikipedia.org/wiki/Hammerfest_(Norvège)', 2, 3, '2020-09-17 11:32:06.434555', NULL, 87),
     (88, 'fr', 'Villes du monde', 'Quelle capitale du Liberia est située au bord de l''océan Atlantique ?', 'Monrovia', 'Nimba', 'Grand Bassa', 'Lofa', 3, 'Monrovia joue un grand rôle dans l''économie du pays en y assurant l''essentiel des exportations de minerai de fer.', 'https://fr.wikipedia.org/wiki/Monrovia', 2, 3, '2020-09-17 11:32:06.434555', NULL, 88),
     (89, 'fr', 'Villes du monde', 'Dans quel pays peut-on déambuler dans les rues de Constantine, Oran ou encore Annaba ?', 'Algérie', 'Jordanie', 'Tunisie', 'Turquie', 3, 'Constantine est également surnommée la ville des ponts suspendus, la ville du vieux rocher ou encore la ville des oulémas.', 'https://fr.wikipedia.org/wiki/Constantine_(Algérie)', 2, 3, '2020-09-17 11:32:06.434555', NULL, 89),
     (90, 'fr', 'Villes du monde', 'À Hong Kong, quel funiculaire relie le quartier de Central à Victoria Peak ?', 'Peak Tram', 'Tsing Ma', 'Cross-Harbour', 'Octopus', 3, 'Le funiculaire est le moyen de transport qui offre aux touristes une des plus belles vues sur le port et les gratte-ciels de Hong Kong.', 'https://fr.wikipedia.org/wiki/Peak_Tram', 2, 3, '2020-09-17 11:32:06.434555', NULL, 90),
     (91, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne désigne pas une boisson énergisante ?', 'Dark Dog', 'Monster Energy', 'Oasis', 'Red Bull', 1, 'La marque est aujourd''hui, en France, la première marque de boisson aux fruits non gazeuse.', 'https://fr.wikipedia.org/wiki/Oasis_(boisson)', 3, 1, '2020-09-18 14:48:09.520789', NULL, 91),
     (92, 'fr', 'Boissons sans alcool', 'Quelle est la saveur du Champomy, appartenant à la marque Orangina Schweppes ?', 'Ananas','Pomme',  'Orange', 'Citron', 1, 'En 2013, Orangina Schweppes se hisse à la seconde place du marché des boissons non-alcoolisées en France.', 'https://fr.wikipedia.org/wiki/Orangina_Schweppes', 3, 1, '2020-09-18 14:48:09.520789', NULL, 92),
     (93, 'fr', 'Boissons sans alcool', 'Dans quelle région de France le Breizh Cola a-t-il été créé et commercialisé depuis 2002 ?', 'Gironde', 'Bretagne','Charente-Maritime', 'Île-de-France', 1, 'Ce cola régional français tire son nom de sa première composition, l''utilisation de noix de kola, et du nom breton de la Bretagne.', 'https://fr.wikipedia.org/wiki/Breizh_Cola', 3, 1, '2020-09-18 14:48:09.520789', NULL, 93),
     (94, 'fr', 'Boissons sans alcool', 'Quelle star a popularisé dans les publicités de la marque Nespresso le slogan  What esle  ?', 'George Clooney', 'Bard Pitt', 'John Travolta', 'Tom Hanks', 1, 'En 2009, l''entreprise a réalisé un chiffre d''affaires de 1,94 milliard d''euros (2,77 milliards de francs suisses).', 'https://fr.wikipedia.org/wiki/Nespresso', 3, 1, '2020-09-18 14:48:09.520789', NULL, 94),
     (95, 'fr', 'Boissons sans alcool', 'Quelles sont les deux couleurs de la marque Coca-Cola et de la Coca-Cola Company ?', 'Rouge et blanche', 'Noire et verte', 'Bleue et orange', 'Jaune et bleue', 1, 'Ce nom provient de deux ingrédients utilisés pour sa composition originelle : la feuille de coca et la noix de kola.', 'https://fr.wikipedia.org/wiki/Coca-Cola', 3, 1, '2020-09-18 14:48:09.520789', NULL, 95),
     (106, 'fr', 'Boissons sans alcool', 'Laquelle des ces couleurs ne retrouve-t-on pas sur le logo de la marque Fanta ?', 'Noire', 'Blanche', 'Bleue', 'Orange', 2, 'Il existe environ 70 saveurs différentes de Fanta, bien que la plupart ne soient commercialisées que dans certaines parties du monde.', 'https://fr.wikipedia.org/wiki/Fanta', 3, 2, '2020-09-18 15:07:46.091152', NULL, 106),
     (107, 'fr', 'Boissons sans alcool', 'Quelle boisson est connue pour contenir du ginger ale, sorte de soda au gingembre ?', 'Canada Dry', '7 Up', 'Fanta', 'Gini', 2, 'Bien que Canada Dry soit originaire du Canada, ses quartiers généraux industriels sont actuellement situés au Texas.', 'https://fr.wikipedia.org/wiki/Canada_Dry', 3, 2, '2020-09-18 15:07:46.091152', NULL, 107),
     (108, 'fr', 'Boissons sans alcool', 'Depuis 1972, quelle marque de café utilise dans ses publicités un expert nommé  gringo  ?',  'Senseo', 'Necafé', 'Café Grand Mère','Jacques Vabre', 2, 'Le café Jacques Vabre doit son nom à un ex-enseignant entré en 1946 dans le commerce de son beau-père.', 'https://fr.wikipedia.org/wiki/Jacques_Vabre', 3, 2, '2020-09-18 15:07:46.091152', NULL, 108),
     (109, 'fr', 'Boissons sans alcool', 'Pour quel jus de fruits Richard Gotainer a-t-il composé  Y''a des fruits, y''a de l''eau  ?', 'Champomy', 'Banga', 'Oasis', 'Joker', 2, 'Créée en 1968 par Pampryl, la marque Banga était très populaire dans les années 1980.', 'https://fr.wikipedia.org/wiki/Banga_(boisson)', 3, 2, '2020-09-18 15:07:46.091152', NULL, 109),
     (110, 'fr', 'Boissons sans alcool', 'Si l''on vous parle de  l''ami du petit-déjeuner , à quelle marque de café pensez-vous ?', 'Malongo', 'Senseo', 'Maxwell','Ricoré',  2, 'Ricoré est célèbre pour sa saga publicitaire, créée en 1981, autour d''une musique composée par André Georget.', 'https://fr.wikipedia.org/wiki/Ricoré', 3, 2, '2020-09-18 15:07:46.091152', NULL, 110),
     (111, 'fr', 'Boissons sans alcool', 'Laquelle de ces propositions ne désigne pas une marque vendant du pastis sans alcool ?',  'Blancart','Pastis 51', 'Girard', 'Pastisade', 3, 'Elle se boit avec de l''eau fraîche et éventuellement des glaçons dans la proportion de un volume de pastis pour cinq ou sept d''eau.', 'https://fr.wikipedia.org/wiki/Pastis_51', 3, 3, '2020-09-18 15:07:46.091152', NULL, 111),
     (112, 'fr', 'Boissons sans alcool', 'Quel ingrédient se retrouve dans plusieurs boissons énergisantes de la marque Red Bull ?', 'Taurine', 'Glutamate', 'Cocaïne', 'Glycine', 3, 'La taurine est l''un des ingrédients retardant l''arrivée de la boisson dans certains pays, par application du principe de précaution.', 'https://fr.wikipedia.org/wiki/Red_Bull_Energy_Drink', 3, 3, '2020-09-18 15:07:46.091152', NULL, 112),
     (113, 'fr', 'Boissons sans alcool', 'Dans sa recette initiale, quel ingrédient le Coca-Cola contenait-il ?', 'De la cocaïne', 'De l''héroïne', 'Du LSD', 'De la marijuana', 3, 'La première recette ancêtre du Coca-Cola, le  French Wine Coca , est inventée par John Pemberton en 1885.', 'https://fr.wikipedia.org/wiki/Coca-Cola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 113),
     (114, 'fr', 'Boissons sans alcool', 'Dans quel pays la boisson gazeuse nommée  Applesin  remporte-t-elle un franc succès ?',  'Argentine', 'Canada', 'Corée du Sud','Islande', 3, 'Depuis 1955, la brasserie produit Eglsl Appelsín, véritable expérience islandaise du soda ou orangeade.', 'https://fr.wikipedia.org/wiki/', 3, 3, '2020-09-18 15:07:46.091152', NULL, 114),
     (115, 'fr', 'Boissons sans alcool', 'La recette de quelle marque de cola est disponible et reproductible librement ?', 'OpenCola', 'Coco-Lala', 'FreeCola', 'Cola-Cola', 3, 'Quelques militants de l''éthique FLOSS ont commencé un projet OpenCola italien, mais sans but lucratif.', 'https://fr.wikipedia.org/wiki/OpenCola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 115),
     (116, 'fr', 'Boissons sans alcool', 'Laquelle de ces personnalités n''a jamais participé à une publicité pour la marque Pepsi ?', 'Zinédine Zidane', 'Michael Jackson', 'David Beckham', 'Madonna', 3, 'En 2010, les ventes de Pepsi Cola en France ont progressé de plus de 36 % sur les quatre premiers mois de l''année 200.', 'https://fr.wikipedia.org/wiki/Pepsi-Cola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 116),
     (117, 'fr', 'Boissons sans alcool', 'Quelle boisson sans alcool est dorée comme l''alcool et a un nom qui sonne comme l''alcool ?', 'Canada Dry', 'Pepsi', 'Sprite', 'Tropicana', 3, 'En 1934, Canada Dry fut l''une des premières marques à proposer des comic books comme cadeau gratuit.', 'https://fr.wikipedia.org/wiki/Canada_Dry', 3, 3, '2020-09-18 15:07:46.091152', NULL, 117),
     (118, 'fr', 'Boissons sans alcool', 'En quelle année la marque Pepsi a-t-elle été créée à New Bern, en Caroline du Nord ?', '1898', '1918', '1938', '1958', 3, 'Caleb D. Bradham, pharmacien à New Bern, inventa une potion à base de noix de cola contre les troubles de la digestion.', 'https://fr.wikipedia.org/wiki/Pepsi-Cola', 3, 3, '2020-09-18 15:07:46.091152', NULL, 118),
     (119, 'fr', 'Boissons sans alcool', 'Dans quelle ville américaine la marque Minute Maid a-t-elle été créée en 1945 ?',  'Chicago', 'New York','Boston', 'Washington', 3, 'Plutôt que d''offrir son jus d''orange sous forme de poudre, la firme décida de créer un produit concentré surgelé.', 'https://fr.wikipedia.org/wiki/Minute_Maid', 3, 3, '2020-09-18 15:07:46.091152', NULL, 119),
     (120, 'fr', 'Boissons sans alcool', 'En quelle année la marque de boissons Schweppes a-t-elle été créée ?', '1783', '1883', '1983', '1683', 3, 'À partir d''avril 2014, la nouvelle égérie de Schweppes devient Pénélope Cruz sur le thème de la sensualité.', 'https://fr.wikipedia.org/wiki/Schweppes', 3, 3, '2020-09-18 15:07:46.091152', NULL, 120),
     (121, 'fr', 'Stades de Ligue 1', 'Depuis 2014, la capacité du stade Vélodrome de Marseille a été portée à combien de places ?', '67 394', '58 832', '49 634', '77 548', 1, 'Le stade Vélodrome, rebaptisé Orange Vélodrome en juillet 2016, répond aux critères des stades de catégorie 4 de l''UEFA.', 'https://fr.wikipedia.org/wiki/Stade_Vélodrome', 4, 1, '2020-09-18 16:10:43.098468', NULL, 121),
     (122, 'fr', 'Stades de Ligue 1', 'Quel club évolue au stade Pierre-Mauroy de Villeneuve-d''Ascq ?', 'Valenciennes FC', 'RC Lens',  'LOSC Lille','Amiens SC', 1, 'Le toit mobile de 7 600 tonnes peut être refermé en trente minutes et sa pelouse se soulève et se déplace sur sa moitié.', 'https://fr.wikipedia.org/wiki/Stade_Pierre-Mauroy', 4, 1, '2020-09-18 16:10:43.098468', NULL, 122),
     (123, 'fr', 'Stades de Ligue 1', 'Le stade Auguste-Delaune accueille les matchs de quel grand club ?', 'Stade de Reims', 'Stade brestois', 'Paris FC', 'AJ Auxerroise', 1, 'Le stade a été officiellement inauguré le 2 juin 1935 par le président de la République Albert Lebrun sous le nom de stade municipal.', 'https://fr.wikipedia.org/wiki/Stade_Auguste-Delaune', 4, 1, '2020-09-18 16:10:43.098468', NULL, 123),
     (124, 'fr', 'Stades de Ligue 1', 'Quel club de Ligue 1 est propriétaire du stade de l''Abbé-Deschamps ?', 'AC Ajaccio', 'AS Nancy-Lorraine', 'FC Lorient', 'AJ Auxerre', 1, 'L''AJ Auxerre en est le propriétaire, seul club français dans ce cas avec l''AC Ajaccio, le Gazélec Ajaccio et l''Olympique lyonnais.', 'https://fr.wikipedia.org/wiki/Stade_de_l''Abbé-Deschamps', 4, 1, '2020-09-18 16:10:43.098468', NULL, 124),
     (125, 'fr', 'Stades de Ligue 1', 'Le stade des Costières a connu la première Division avec quel club ?', 'Nîmes Olympique', 'Tours FC', 'FC de Guengnon', 'RC Lens', 1, 'Trentième stade français au nombre de places proposées, l''enceinte a été également utilisée pour des matchs de rugby à XV.', 'https://fr.wikipedia.org/wiki/Stade_des_Costières', 4, 1, '2020-09-18 16:10:43.098468', NULL, 125),
     (126, 'fr', 'Stades de Ligue 1', 'Quel est le véritable nom du stade de Furiani, utilisé par le FC Bastia ?', 'Armand-Cesari', 'Victor-Lorenzi', 'Claude-Papi', 'Jean-Bouin', 1, 'Furiani reste également dans les mémoires pour la catastrophe qui marqua la demi-finale de la coupe de France de 1992.', 'https://fr.wikipedia.org/wiki/Stade_Armand-Cesari', 4, 1, '2020-09-18 16:10:43.098468', NULL, 126),
     (127, 'fr', 'Stades de Ligue 1', 'Le stade du Moustoir accueille le Festival interceltique mais aussi quel club résident ?',  'Stade Brestois 29', 'Vannes Olympique','FC Lorient', 'AJ Auxerre', 1, 'Le groupe Supertramp a également donné un concert exceptionnel dans le stade du Moustoir en 1983.', 'https://fr.wikipedia.org/wiki/Stade_du_Moustoir', 4, 1, '2020-09-18 16:10:43.098468', NULL, 127),
     (128, 'fr', 'Stades de Ligue 1', 'Quelle grande enceinte sportive est également le stade du Toulouse FC ?', 'Stadium municipal', 'Stade  Wallon', 'Palais des Sports', 'Matmut-Atlantique', 1, 'Situé sur l''île du Ramier, on le surnomme le petit Wembley en référence à son architecture proche du mythique stade anglais.', 'https://fr.wikipedia.org/wiki/Stadium_de_Toulouse', 4, 1, '2020-09-18 16:10:43.098468', NULL, 128),
     (129, 'fr', 'Stades de Ligue 1', 'Quel est le surnom du stade Geoffroy-Guichard, situé à Saint-Étienne ?', 'Le Chaudron', 'La Marmite', 'La Cuvette', 'Le Puits', 1, 'À l''origine, il s''agit en fait d''un vaste terrain de 40 000 m2 acheté par Geoffroy Guichard, fondateur des magasins Casino.', 'https://fr.wikipedia.org/wiki/Stade_Geoffroy-Guichard', 4, 1, '2020-09-18 16:10:43.098468', NULL, 129),
     (130, 'fr', 'Stades de Ligue 1', 'A quoi le stade de la Mosson du Montpellier Hérault SC doit-il son nom ?', 'Un attaquant', 'Une rivière', 'Un chien', 'Une supportrice', 1, 'Lors d''orages cévenols, la rivière Mosson qui coule à proximité peut provoquer avec ses crues d''importants dégâts au stade.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Mosson', 4, 1, '2020-09-18 16:10:43.098468', NULL, 130),
     (131, 'fr', 'Stades de Ligue 1', 'Quel club évolue au stade Bollaert-Delelis, initialement nommé stade Félix-Bollaert ?', 'RC Lens', 'LOSC Lille', 'Amiens SC', 'Valenciennes FC', 2, 'Depuis 2013, le club est présidé par Gervais Martel, qui avait déjà assuré la présidence du même club de 1988 à 2012.', 'https://fr.wikipedia.org/wiki/Racing_Club_de_Lens', 4, 2, '2020-09-18 16:10:43.098468', NULL, 131),
     (132, 'fr', 'Stades de Ligue 1', 'Le stade de la Meinau est le stade de quelle grande ville de l''est de la France ?', 'Starsbourg', 'Mulhouse', 'Belfort', 'Colmar', 2, 'Principal équipement sportif de la ville, l''enceinte accueille ponctuellement d''autres évènements sportifs ou culturels.', 'https://fr.wikipedia.org/wiki/Stade_de_la_Meinau', 4, 2, '2020-09-18 16:10:43.098468', NULL, 132),
     (133, 'fr', 'Stades de Ligue 1', 'Sur quelle île a été construit le stade du FC Metz en 1923 ?',  'Saint-Germain', 'Saint-Martin', 'Saint-Julien', 'Saint-Symphorien', 2, 'Le 6 juin 2009, Johnny Hallyday y donne un concert pour sa dernière tournée  Tour 66 , devant plus de 35 000 personnes.', 'https://fr.wikipedia.org/wiki/Stade_Saint-Symphorien', 4, 2, '2020-09-18 16:10:43.098468', NULL, 133),
     (134, 'fr', 'Stades de Ligue 1', 'Quel est le joli nom du centre d''entraînement du FC Nantes  ?', 'Jonelière', 'Piverdière', 'Lavandière', 'Canebière', 2, 'Les différentes infrastructures du club sont regroupées au sein du Centre sportif José-Arribas (Centre sportif de La Jonelière).', 'https://fr.wikipedia.org/wiki/La_Chapelle-sur-Erdre', 4, 2, '2020-09-18 16:10:43.098468', NULL, 134),
     (135, 'fr', 'Stades de Ligue 1', 'Le Havre AC a quitté le stade Jules-Deschaseaux pour rejoindre quelle enceinte ?', 'Stade Océane', 'Stade Maritime', 'Stade de la Manche', 'Stade du Ray', 2, 'Le Stade Océane est un stade multifonction de 25 178 places assises pour le sport et 33 000 pour les spectacles.', 'https://fr.wikipedia.org/wiki/Stade_Océane', 4, 2, '2020-09-18 16:10:43.098468', NULL, 135),
     (145, 'fr', 'Stades de Ligue 1', 'Avec quel club le stade Louis-Dugaugez a-t-il découvert la Ligue 1 en 2000 ?', 'ESTAC Troyes', 'RC Lens', 'Stade de Reims', 'CS Sedan Ardennes', 3, 'La construction de la quatrième et dernière tribune a débuté le 26 avril 2001 et s''est terminée le 13 septembre 2001.', 'https://fr.wikipedia.org/wiki/Stade_Louis-Dugauguez', 4, 3, '2020-09-18 16:10:43.098468', NULL, 145),
     (146, 'fr', 'Stades de Ligue 1', 'Quel est le surnom du stade Pierre-de-Couertin situé à Cannes ?','Rocca', 'Polka', 'Bocca',  'Bossa', 3, 'Ce stade était à l''origine consacré à l''athlétisme et au rugby alors que le football évoluait au stade des Hespérides.', 'https://fr.wikipedia.org/wiki/Stade_Pierre-de-Coubertin_(Cannes)', 4, 3, '2020-09-18 16:10:43.098468', NULL, 146),
     (147, 'fr', 'Stades de Ligue 1', 'En 1980, le stade Yves-Jaguin a été remplacé par quel autre stade ?', 'Roudourou', 'Roudoudou', 'Rouloulou', 'Rougoudou', 3, 'Le stade Yves-Jaguin a néanmoins accueilli l''équipe première de l''En Avant de Guingamp de 1921 à 1990.', 'https://fr.wikipedia.org/wiki/Stade_Yves-Jaguin', 4, 3, '2020-09-18 16:10:43.098468', NULL, 147),
     (148, 'fr', 'Stades de Ligue 1', 'Quels championnats le stade Gaston-Petit a-t-il accueilli en 2009, 2010 et 2011 ?', 'Duathlon', 'Triathlon', 'Volley-ball', 'Cricket', 3, 'Le stade Gaston-Petit de 17 072 places, inauguré en 1964, est un équipement sportif de la ville de Châteauroux.', 'https://fr.wikipedia.org/wiki/Stade_Gaston-Petit', 4, 3, '2020-09-18 16:10:43.098468', NULL, 148),
     (149, 'fr', 'Stades de Ligue 1', 'Dans laquelle de ces villes ne trouve-t-on pas de stade Jean-Bouin ?',  'Nîmes', 'Marseille', 'Lyon','Angers', 3, 'Jean Bouin est un athlète français de course de fond détenteur de sept records du monde sur différentes distances et durées.', 'https://fr.wikipedia.org/wiki/Stade_Jean-Bouin', 4, 3, '2020-09-18 16:10:43.098468', NULL, 149),
     (150, 'fr', 'Stades de Ligue 1', 'Quel est le nom du stade du Gazélec Ajaccio, le plus petit de la Ligue 1 en 2015 ?', 'Ange-Casanova', 'Armand-Cesari', 'François-Coty', 'Décines-Charpieu', 3, 'La capacité du stade fut portée à 5 000 places en 2015 à la suite de la montée du club en Ligue 1.', 'https://fr.wikipedia.org/wiki/Stade_Ange-Casanova', 4, 3, '2020-09-18 16:10:43.098468', NULL, 150),
     (151, 'fr', 'Réseaux sociaux', 'Sur l''outil de microblogage  Twitter , combien de caractères maximum peut contenir un tweet ?', '140', '255', '80', '500', 1, ' Twitter  a été créé le 21 mars 2006 par Jack Dorsey, Evan Williams, Biz Stone et Noah Glass.', 'https://fr.wikipedia.org/wiki/Twitter', 5, 1, '2020-09-18 18:20:46.777109', NULL, 151),
     (152, 'fr', 'Réseaux sociaux', 'Parmi ces réseaux sociaux fort appréciés, lequel a connu la plus forte croissance en 2014 ?',' SoundCloud ', ' Facebook ', ' LinkedIn ',  ' Pinterest ', 1, 'Le nom du site est un mot-valise des mots anglais  pin  et  interest  signifiant respectivement  épingler  et  intérêt .', 'https://fr.wikipedia.org/wiki/Pinterest', 5, 1, '2020-09-18 18:20:46.777109', NULL, 152),
     (153, 'fr', 'Réseaux sociaux', 'Quel informaticien et chef d''entreprise américain a inventé  Facebook  ?', 'Mark Zuckeberg', 'Larry Page', 'Steve Ballmer', 'Paul Allen', 1, 'Mark Zuckeberg est aujourd''hui le plus jeune milliardaire du monde derrière son camarade Dustin Moskovitz.', 'https://fr.wikipedia.org/wiki/Facebook', 5, 1, '2020-09-18 18:20:46.777109', NULL, 153),
     (154, 'fr', 'Réseaux sociaux', 'Récemment diplômé(e), sur quel réseau social allez-vous probablement rechercher un job ?', ' LinkedIn ', ' Tinder ', ' Twich ', ' Reddit ', 1, 'Le site revendique plus de 400 millions de membres issus de 170 secteurs d''activités dans plus de 200 pays.', 'https://fr.wikipedia.org/wiki/LinkedIn', 5, 1, '2020-09-18 18:20:46.777109', NULL, 154),
     (155, 'fr', 'Réseaux sociaux', 'Que pouvez-vous principalement partager sur le site web  Flickr , développé par Ludicorp ?', 'Des vidéos', 'Des adresses', 'Des photos', 'De la musique', 1, 'Sur  Flickr , un utilisateur d''un compte gratuit dispose d''un espace d''un téraoctet pour stocker des photos et des vidéos.', 'https://fr.wikipedia.org/wiki/Flickr', 5, 1, '2020-09-18 18:20:46.777109', NULL, 155),
     (156, 'fr', 'Réseaux sociaux', 'Quelle célébrité de la télévision a pris le selfie le plus  retweeté  de l''histoire ?', 'Ellen DeGeneres', 'Kim Kardashian', 'Oprah Winfrey', 'Jenny McCarthy', 1, 'Ellen DeGeneres est une cousine éloignée de Catherine Middleton, duchesse de Cambridge et épouse de William.', 'https://fr.wikipedia.org/wiki/Ellen_DeGeneres', 5, 1, '2020-09-18 18:20:46.777109', NULL, 156),
     (157, 'fr', 'Réseaux sociaux', 'Avec  Instagram , on peut bien évidemment prendre des photos, mais aussi réaliser...', 'Une vidéo', 'Une présentation', 'Un document texte', 'Une musique', 1, 'L''application et le service de partage  Instagram  ont été rachetés par la société  Facebook  en 2012 pour plus d''un milliard de dollars.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 1, '2020-09-18 18:20:46.777109', NULL, 157),
     (158, 'fr', 'Réseaux sociaux', 'Quelle application de  Twitter  héberge des vidéos de 6 secondes tournant en boucle ?',  ' SoundCloud ', ' Instagram ', ' Vine ',' Viber ', 1, 'Comme sur  Twitter , il est possible d''accompagner son  Vine  d''une petite description ainsi que des mots-clés et de hashtag.', 'https://fr.wikipedia.org/wiki/Vine', 5, 1, '2020-09-18 18:20:46.777109', NULL, 158),
     (159, 'fr', 'Réseaux sociaux', 'À quel réseau social américain êtes-vous accro si vous n''arrêtez pas de  piner  ?', ' Pinterest ', ' Tumblr ', ' Google + ', ' Facebook ', 1, ' Pinterest  propose à ses utilisateurs d''épingler dans différentes rubriques des images qui ont pu attirer leur attention.', 'https://fr.wikipedia.org/wiki/Pinterest', 5, 1, '2020-09-18 18:20:46.777109', NULL, 159),
     (160, 'fr', 'Réseaux sociaux', 'Quel réseau social truste la première place des réseaux sociaux professionnels ?', ' LinkedIn ', ' Heeloo ', ' Movim ', ' Friendster ', 1, ' LinkedIn  constitue aujourd''hui un moyen efficace pour construire, développer et enrichir son capital social.', 'https://fr.wikipedia.org/wiki/LinkedIn', 5, 1, '2020-09-18 18:20:46.777109', NULL, 160),
     (161, 'fr', 'Réseaux sociaux', 'Quel site communautaire très actif est la source de nombreux documents postés sur Internet ?', ' Lurker ',' Reddit ', ' Delicious ',  ' Twich ', 2, 'Le site  Reddit  est fort d''une communauté se retrouvant autour d''une culture propre à l''histoire du site.', 'https://fr.wikipedia.org/wiki/Reddit', 5, 2, '2020-09-18 18:20:46.777109', NULL, 161),
     (162, 'fr', 'Réseaux sociaux', 'Quel concurrent direct de  Snapchat  a été lancé par  Facebook  ?',' Private Messenger ',  ' Slingshot ', ' Whisper ', ' Facesnap ', 2, 'La particularité de cette application est l''existence d''une limite de temps de visualisation du média envoyé à ses destinataires.', 'https://fr.wikipedia.org/wiki/Snapchat', 5, 2, '2020-09-18 18:20:46.777109', NULL, 162),
     (163, 'fr', 'Réseaux sociaux', 'Fin 2014, combien d''utilisateurs comptait l''application  Instagram  depuis octobre 2010 ?', '200 millions', '300 millions', '100 millions', '400 millions', 2, 'En août 2014, Instagram a lancé  Hyperlapse , une application vidéo permettant de réaliser des time-lapse.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 2, '2020-09-18 18:20:46.777109', NULL, 163),
     (164, 'fr', 'Réseaux sociaux', 'Quel était en 2014 le pourcentage d''internautes français inscrits sur les réseaux sociaux ?', '37 %', '65 %', '80 %', '50 %', 2, 'La  règle de 150  ou  nombre de Dunbar  affirme que la taille d''un réseau social originel est limité à environ 150 membres.', 'https://fr.wikipedia.org/wiki/Réseau_social', 5, 2, '2020-09-18 18:20:46.777109', NULL, 164),
     (165, 'fr', 'Réseaux sociaux', 'En quelle année a été fondé  Twitter , outil de microblogage géré par l''entreprise Twitter Inc ?',  '2002', '2004', '2006','2008', 2, ' Twitter  a été créé à San Francisco au sein de la startup  Odeo  fondée par Noah Glass et Evan Williams.', 'https://fr.wikipedia.org/wiki/Twitter', 5, 2, '2020-09-18 18:20:46.777109', NULL, 165),
     (166, 'fr', 'Réseaux sociaux', 'Quel média social permet d''indiquer où l''on se trouve et de recommander des sorties ?', ' Foursquare ', ' Viadeo ', ' Piwie ', ' Kaki ', 2, 'L''aspect ludique de  Foursquare  vient du fait qu''il est possible à l''utilisateur de gagner des points et d''accumuler des badges.', 'https://fr.wikipedia.org/wiki/Foursquare', 5, 2, '2020-09-18 18:20:46.777109', NULL, 166),
     (167, 'fr', 'Réseaux sociaux', 'Quelle agence de renseignement, équivalent de la DGSE, a ouvert son compte  Twitter  en 2014 ?', 'CIA', 'MI6', 'NSA', 'KGB', 2, 'La CIA a influencé parfois de façon décisive l''histoire politique des États dans lesquels elle est intervenue.', 'https://fr.wikipedia.org/wiki/Central_Intelligence_Agency', 5, 2, '2020-09-18 18:20:46.777109', NULL, 167),
     (168, 'fr', 'Réseaux sociaux', 'Qu''allez-vous échanger si une Youtubeuse vous propose de faire un  swap  ?', 'Des messages',  'Des cadeaux','Des vidéos', 'Des blagues', 2, 'La plupart des vidéos du site ou les chaînes YouTube peuvent être visualisées par tous les internautes.', 'https://fr.wikipedia.org/wiki/YouTube', 5, 2, '2020-09-18 18:20:46.777109', NULL, 168),
     (169, 'fr', 'Réseaux sociaux', 'Combien de photos sont environ partagées chaque jour sur le réseau  Instagram  ?',  '45 millions', '35 millions', '55 millions', '25 millions', 2, 'La publicité est un enjeu important pour  Instagram  et plus encore pour  Facebook , propriétaire du réseau.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 2, '2020-09-18 18:20:46.777109', NULL, 169),
     (170, 'fr', 'Réseaux sociaux', 'Quelle plate-forme de microblogage accueille 300 millions de visiteurs uniques mensuels ?', ' Tumblr ', ' Reddit ', ' Tinder ', ' Pinterest ', 2, 'L''inscription sur Tumblr est gratuite et ne nécessite qu''une adresse e-mail, un nom d''utilisateur et un mot de passe.', 'https://fr.wikipedia.org/wiki/Tumblr', 5, 2, '2020-09-18 18:20:46.777109', NULL, 170),
     (171, 'fr', 'Réseaux sociaux', 'Quel réseau social cherche à s''adapter aux particularités culturelles de chaque pays ?', ' Viadeo ', ' Piwie ', ' Kaki ', ' Foursquare ', 3, 'Pour ses membres,  Viadeo  est aussi un outil de gestion de réputation en ligne et de  personal branding .', 'https://fr.wikipedia.org/wiki/Viadeo', 5, 3, '2020-09-18 18:20:46.777109', NULL, 171),
     (172, 'fr', 'Réseaux sociaux', 'Pour combien de dollars  Facebook  a-t-il racheté l''application mobile  Whatsapp  ?', '19 milliards', '850 millions', '220 millions', '650 000', 3, ' Whatsapp  a été racheté par  Facebook  en février 2014 pour environ 19 milliards de dollars, dont 15 milliards en actions.', 'https://fr.wikipedia.org/wiki/WhatsApp', 5, 3, '2020-09-18 18:20:46.777109', NULL, 172),
     (173, 'fr', 'Réseaux sociaux', 'Quel ancien réseau social made in France se revendiquait comme étant LE tchat business ?',  ' Foursquare ', ' Viadeo ', ' Piwie ',' XING ', 3, ' Piwie  mettait en relation tous ceux qui souhaitaient créer une entreprise avec ceux qui cherchaient un associé.', 'https://fr.wikipedia.org/wiki/Réseau_social', 5, 3, '2020-09-18 18:20:46.777109', NULL, 173),
     (174, 'fr', 'Réseaux sociaux', 'En 2014, quel lieu très touristique a été le plus partagé sur  Instagram  ?', 'Le Taj Mahal', 'Le Louvre', 'Time Square',  'Disneyland',3, ' Instagram  a subi de nombreuses critiques à cause de sa politique de censure, jugée disproportionnée.', 'https://fr.wikipedia.org/wiki/Instagram', 5, 3, '2020-09-18 18:20:46.777109', NULL, 174),
     (175, 'fr', 'Réseaux sociaux', 'Quel ancien réseau social aujourd''hui disparu était orienté 100 % geek et jeux vidéo ?', ' Piwie ', ' Kipi ', ' Foursquare ', ' Viadeo ', 3, 'De plus en plus de réseaux sociaux privatifs se créent sur le net, formant ainsi en quelque sorte des clubs  privés .', 'https://fr.wikipedia.org/wiki/Réseau_social', 5, 3, '2020-09-18 18:20:46.777109', NULL, 175);

-- 

INSERT INTO "quiz_has_subcategory" ("subcategory_id", "quizzes_id", "created_at", "id") VALUES 
    (11, 1, '2020-09-18 14:35:54.402069', 1),
    (11, 2, '2020-09-18 14:35:54.402069', 2),
    (11, 3, '2020-09-18 14:35:54.402069', 3),
    (11, 4, '2020-09-18 14:35:54.402069', 4),
    (11, 5, '2020-09-18 14:35:54.402069', 5),
    (11, 6, '2020-09-18 14:35:54.402069', 6),
    (11, 7, '2020-09-18 14:35:54.402069', 7),
    (11, 8, '2020-09-18 14:35:54.402069', 8),
    (11, 9, '2020-09-18 14:35:54.402069', 9),
    (11, 10, '2020-09-18 14:35:54.402069', 10),
    (11, 11, '2020-09-18 14:35:54.402069', 11),
    (11, 12, '2020-09-18 14:35:54.402069', 12),
    (11, 13, '2020-09-18 14:35:54.402069', 13),
    (11, 14, '2020-09-18 14:35:54.402069', 14),
    (11, 15, '2020-09-18 14:35:54.402069', 15),
    (11, 16, '2020-09-18 14:35:54.402069', 16),
    (11, 17, '2020-09-18 14:35:54.402069', 17),
    (11, 18, '2020-09-18 14:35:54.402069', 18),
    (11, 19, '2020-09-18 14:35:54.402069', 19),
    (11, 20, '2020-09-18 14:35:54.402069', 20),
    (11, 21, '2020-09-18 14:35:54.402069', 21),
    (11, 22, '2020-09-18 14:35:54.402069', 22),
    (11, 23, '2020-09-18 14:35:54.402069', 23),
    (11, 24, '2020-09-18 14:35:54.402069', 24),
    (11, 25, '2020-09-18 14:35:54.402069', 25),
    (11, 26, '2020-09-18 14:35:54.402069', 26),
    (11, 27, '2020-09-18 14:35:54.402069', 27),
    (11, 28, '2020-09-18 14:35:54.402069', 28),
    (11, 29, '2020-09-18 14:35:54.402069', 29),
    (11, 30, '2020-09-18 14:35:54.402069', 30),
    (12, 31, '2020-09-18 14:35:54.402069', 31),
    (12, 32, '2020-09-18 14:40:28.968446', 32),
    (12, 33, '2020-09-18 14:40:28.968446', 33),
    (12, 34, '2020-09-18 14:40:28.968446', 34),
    (12, 35, '2020-09-18 14:40:28.968446', 35),
    (12, 36, '2020-09-18 14:40:28.968446', 36),
    (12, 37, '2020-09-18 14:40:28.968446', 37),
    (12, 38, '2020-09-18 14:40:28.968446', 38),
    (12, 39, '2020-09-18 14:40:28.968446', 39),
    (12, 40, '2020-09-18 14:40:28.968446', 40),
    (12, 41, '2020-09-18 14:40:28.968446', 41),
    (12, 42, '2020-09-18 14:40:28.968446', 42),
    (12, 43, '2020-09-18 14:40:28.968446', 43),
    (12, 44, '2020-09-18 14:40:28.968446', 44),
    (12, 45, '2020-09-18 14:40:28.968446', 45),
    (12, 46, '2020-09-18 14:40:28.968446', 46),
    (12, 47, '2020-09-18 14:40:28.968446', 47),
    (12, 48, '2020-09-18 14:40:28.968446', 48),
    (12, 49, '2020-09-18 14:40:28.968446', 49),
    (12, 50, '2020-09-18 14:40:28.968446', 50),
    (12, 51, '2020-09-18 14:40:28.968446', 51),
    (12, 52, '2020-09-18 14:40:28.968446', 52),
    (12, 53, '2020-09-18 14:40:28.968446', 53),
    (12, 54, '2020-09-18 14:40:28.968446', 54),
    (12, 55, '2020-09-18 14:40:28.968446', 55),
    (12, 56, '2020-09-18 14:40:28.968446', 56),
    (12, 57, '2020-09-18 14:40:28.968446', 57),
    (12, 58, '2020-09-18 14:40:28.968446', 58),
    (12, 59, '2020-09-18 14:40:28.968446', 59),
    (12, 60, '2020-09-18 14:40:28.968446', 60),
    (16, 61, '2020-09-18 14:44:07.69807', 61),
    (16, 62, '2020-09-18 14:44:07.69807', 62),
    (16, 63, '2020-09-18 14:44:07.69807', 63),
    (16, 64, '2020-09-18 14:44:07.69807', 64),
    (16, 65, '2020-09-18 14:44:07.69807', 65),
    (16, 66, '2020-09-18 14:44:07.69807', 66),
    (16, 67, '2020-09-18 14:44:07.69807', 67),
    (16, 68, '2020-09-18 14:44:07.69807', 68),
    (16, 69, '2020-09-18 14:44:07.69807', 69),
    (16, 70, '2020-09-18 14:44:07.69807', 70),
    (16, 71, '2020-09-18 14:44:07.69807', 71),
    (16, 72, '2020-09-18 14:44:07.69807', 72),
    (16, 73, '2020-09-18 14:44:07.69807', 73),
    (16, 74, '2020-09-18 14:44:07.69807', 74),
    (16, 75, '2020-09-18 14:44:07.69807', 75),
    (16, 76, '2020-09-18 14:44:07.69807', 76),
    (16, 77, '2020-09-18 14:44:07.69807', 77),
    (16, 78, '2020-09-18 14:44:07.69807', 78),
    (16, 79, '2020-09-18 14:44:07.69807', 79),
    (16, 80, '2020-09-18 14:44:07.69807', 80),
    (16, 81, '2020-09-18 14:44:07.69807', 81),
    (16, 82, '2020-09-18 14:44:07.69807', 82),
    (16, 83, '2020-09-18 14:44:07.69807', 83),
    (16, 84, '2020-09-18 14:44:07.69807', 84),
    (16, 85, '2020-09-18 14:44:07.69807', 85),
    (16, 86, '2020-09-18 14:44:07.69807', 86),
    (16, 87, '2020-09-18 14:44:07.69807', 87),
    (16, 88, '2020-09-18 14:44:07.69807', 88),
    (16, 89, '2020-09-18 14:44:07.69807', 89),
    (16, 90, '2020-09-18 14:44:07.69807', 90),
    (20, 91, '2020-09-18 15:00:32.242722', 91),
    (20, 92, '2020-09-18 15:00:32.242722', 92),
    (20, 93, '2020-09-18 15:00:32.242722', 93),
    (20, 94, '2020-09-18 15:00:32.242722', 94),
    (20, 95, '2020-09-18 15:00:32.242722', 95),
    (20, 96, '2020-09-18 15:00:32.242722', 96),
    (20, 97, '2020-09-18 15:00:32.242722', 97),
    (20, 98, '2020-09-18 15:00:32.242722', 98),
    (20, 99, '2020-09-18 15:00:32.242722', 99),
    (20, 100, '2020-09-18 15:00:32.242722', 100),
    (20, 101, '2020-09-18 16:01:10.860299', 101),
    (20, 102, '2020-09-18 16:01:10.860299', 102),
    (20, 103, '2020-09-18 16:01:10.860299', 103),
    (20, 104, '2020-09-18 16:01:10.860299', 104),
    (20, 105, '2020-09-18 16:01:10.860299', 105),
    (20, 106, '2020-09-18 16:01:10.860299', 106),
    (20, 107, '2020-09-18 16:01:10.860299', 107),
    (20, 108, '2020-09-18 16:01:10.860299', 108),
    (20, 109, '2020-09-18 16:01:10.860299', 109),
    (20, 110, '2020-09-18 16:01:10.860299', 110),
    (20, 111, '2020-09-18 16:01:10.860299', 111),
    (20, 112, '2020-09-18 16:01:10.860299', 112),
    (20, 113, '2020-09-18 16:01:10.860299', 113),
    (20, 114, '2020-09-18 16:01:10.860299', 114),
    (20, 115, '2020-09-18 16:01:10.860299', 115),
    (20, 116, '2020-09-18 16:01:10.860299', 116),
    (20, 117, '2020-09-18 16:01:10.860299', 117),
    (20, 118, '2020-09-18 16:01:10.860299', 118),
    (20, 119, '2020-09-18 16:01:10.860299', 119),
    (20, 120, '2020-09-18 16:01:10.860299', 120),
    (25, 121, '2020-09-18 18:06:09.997789', 121),
    (25, 122, '2020-09-18 18:09:49.90753', 122),
    (25, 123, '2020-09-18 18:09:49.90753', 123),
    (25, 124, '2020-09-18 18:09:49.90753', 124),
    (25, 125, '2020-09-18 18:09:49.90753', 125),
    (25, 126, '2020-09-18 18:09:49.90753', 126),
    (25, 127, '2020-09-18 18:09:49.90753', 127),
    (25, 128, '2020-09-18 18:09:49.90753', 128),
    (25, 129, '2020-09-18 18:09:49.90753', 129),
    (25, 130, '2020-09-18 18:09:49.90753', 130),
    (25, 131, '2020-09-18 18:09:49.90753', 131),
    (25, 132, '2020-09-18 18:09:49.90753', 132),
    (25, 133, '2020-09-18 18:09:49.90753', 133),
    (25, 134, '2020-09-18 18:09:49.90753', 134),
    (25, 135, '2020-09-18 18:09:49.90753', 135),
    (25, 136, '2020-09-18 18:09:49.90753', 136),
    (25, 137, '2020-09-18 18:09:49.90753', 137),
    (25, 138, '2020-09-18 18:09:49.90753', 138),
    (25, 139, '2020-09-18 18:09:49.90753', 139),
    (25, 140, '2020-09-18 18:09:49.90753', 140),
    (25, 141, '2020-09-18 18:09:49.90753', 141),
    (25, 142, '2020-09-18 18:09:49.90753', 142),
    (25, 143, '2020-09-18 18:09:49.90753', 143),
    (25, 144, '2020-09-18 18:09:49.90753', 144),
    (25, 145, '2020-09-18 18:09:49.90753', 145),
    (25, 146, '2020-09-18 18:09:49.90753', 146),
    (25, 147, '2020-09-18 18:09:49.90753', 147),
    (25, 148, '2020-09-18 18:09:49.90753', 148),
    (25, 149, '2020-09-18 18:09:49.90753', 149),
    (25, 150, '2020-09-18 18:09:49.90753', 150),
    (28, 151, '2020-09-18 19:01:22.735487', 151),
    (28, 152, '2020-09-18 19:04:17.354219', 152),
    (28, 153, '2020-09-18 19:04:17.354219', 153),
    (28, 154, '2020-09-18 19:04:17.354219', 154),
    (28, 155, '2020-09-18 19:04:17.354219', 155),
    (28, 156, '2020-09-18 19:04:17.354219', 156),
    (28, 157, '2020-09-18 19:04:17.354219', 157),
    (28, 158, '2020-09-18 19:04:17.354219', 158),
    (28, 159, '2020-09-18 19:04:17.354219', 159),
    (28, 160, '2020-09-18 19:04:17.354219', 160),
    (28, 161, '2020-09-18 19:04:17.354219', 161),
    (28, 162, '2020-09-18 19:04:17.354219', 162),
    (28, 163, '2020-09-18 19:04:17.354219', 163),
    (28, 164, '2020-09-18 19:04:17.354219', 164),
    (28, 165, '2020-09-18 19:04:17.354219', 165),
    (28, 166, '2020-09-18 19:04:17.354219', 166),
    (28, 167, '2020-09-18 19:04:17.354219', 167),
    (28, 168, '2020-09-18 19:04:17.354219', 168),
    (28, 169, '2020-09-18 19:04:17.354219', 169),
    (28, 170, '2020-09-18 19:04:17.354219', 170),
    (28, 171, '2020-09-18 19:04:17.354219', 171),
    (28, 172, '2020-09-18 19:04:17.354219', 172),
    (28, 173, '2020-09-18 19:04:17.354219', 173),
    (28, 174, '2020-09-18 19:04:17.354219', 174),
    (28, 175, '2020-09-18 19:04:17.354219', 175),
    (28, 176, '2020-09-18 19:04:17.354219', 176),
    (28, 177, '2020-09-18 19:04:17.354219', 177),
    (28, 178, '2020-09-18 19:04:17.354219', 178),
    (28, 179, '2020-09-18 19:04:17.354219', 179),
    (28, 180, '2020-09-18 19:04:17.354219', 180),
    (8, 181, '2020-09-18 21:54:12.248452', 181),
    (8, 182, '2020-09-18 21:54:12.248452', 182),
    (8, 183, '2020-09-18 21:54:12.248452', 183),
    (8, 184, '2020-09-18 21:54:12.248452', 184),
    (8, 185, '2020-09-18 21:54:12.248452', 185),
    (8, 186, '2020-09-18 21:54:12.248452', 186),
    (8, 187, '2020-09-18 21:54:12.248452', 187),
    (8, 188, '2020-09-18 21:54:12.248452', 188),
    (8, 189, '2020-09-18 21:54:12.248452', 189),
    (8, 190, '2020-09-18 21:54:12.248452', 190),
    (8, 191, '2020-09-18 21:54:12.248452', 191),
    (8, 192, '2020-09-18 21:54:12.248452', 192),
    (8, 193, '2020-09-18 21:54:12.248452', 193),
    (8, 194, '2020-09-18 21:54:12.248452', 194),
    (8, 195, '2020-09-18 21:54:12.248452', 195),
    (8, 196, '2020-09-18 21:54:12.248452', 196),
    (8, 197, '2020-09-18 21:54:12.248452', 197),
    (8, 198, '2020-09-18 21:54:12.248452', 198),
    (8, 199, '2020-09-18 21:54:12.248452', 199),
    (8, 200, '2020-09-18 21:54:12.248452', 200),
    (8, 201, '2020-09-18 21:54:12.248452', 201),
    (8, 202, '2020-09-18 21:54:12.248452', 202),
    (8, 203, '2020-09-18 21:54:12.248452', 203),
    (8, 204, '2020-09-18 21:54:12.248452', 204),
    (8, 205, '2020-09-18 21:54:12.248452', 205),
    (8, 206, '2020-09-18 21:54:12.248452', 206),
    (8, 207, '2020-09-18 21:54:12.248452', 207),
    (8, 208, '2020-09-18 21:54:12.248452', 208),
    (8, 209, '2020-09-18 21:54:12.248452', 209),
    (8, 210, '2020-09-18 21:54:12.248452', 210),
    (5, 211, '2020-09-18 22:23:50.090147', 211),
    (5, 212, '2020-09-18 22:23:50.090147', 212),
    (5, 213, '2020-09-18 22:23:50.090147', 213),
    (5, 214, '2020-09-18 22:23:50.090147', 214),
    (5, 215, '2020-09-18 22:23:50.090147', 215),
    (5, 216, '2020-09-18 22:23:50.090147', 216),
    (5, 217, '2020-09-18 22:23:50.090147', 217),
    (5, 218, '2020-09-18 22:23:50.090147', 218),
    (5, 219, '2020-09-18 22:23:50.090147', 219),
    (5, 220, '2020-09-18 22:23:50.090147', 220),
    (5, 221, '2020-09-18 22:23:50.090147', 221),
    (5, 222, '2020-09-18 22:23:50.090147', 222),
    (5, 223, '2020-09-18 22:23:50.090147', 223),
    (5, 224, '2020-09-18 22:23:50.090147', 224),
    (5, 225, '2020-09-18 22:23:50.090147', 225),
    (5, 226, '2020-09-18 22:23:50.090147', 226),
    (5, 227, '2020-09-18 22:23:50.090147', 227),
    (5, 228, '2020-09-18 22:23:50.090147', 228),
    (5, 229, '2020-09-18 22:23:50.090147', 229),
    (5, 230, '2020-09-18 22:23:50.090147', 230),
    (5, 231, '2020-09-18 22:23:50.090147', 231),
    (5, 232, '2020-09-18 22:23:50.090147', 232),
    (5, 233, '2020-09-18 22:23:50.090147', 233),
    (5, 234, '2020-09-18 22:23:50.090147', 234),
    (5, 235, '2020-09-18 22:23:50.090147', 235),
    (5, 236, '2020-09-18 22:23:50.090147', 236),
    (5, 237, '2020-09-18 22:23:50.090147', 237),
    (5, 238, '2020-09-18 22:23:50.090147', 238),
    (5, 239, '2020-09-18 22:23:50.090147', 239),
    (5, 240, '2020-09-18 22:23:50.090147', 240),
    (31, 241, '2020-09-18 23:20:58.932687', 241),
    (31, 242, '2020-09-18 23:20:58.932687', 242),
    (31, 243, '2020-09-18 23:20:58.932687', 243),
    (31, 244, '2020-09-18 23:20:58.932687', 244),
    (31, 245, '2020-09-18 23:20:58.932687', 245),
    (31, 246, '2020-09-18 23:20:58.932687', 246),
    (31, 247, '2020-09-18 23:20:58.932687', 247),
    (31, 248, '2020-09-18 23:20:58.932687', 248),
    (31, 249, '2020-09-18 23:20:58.932687', 249),
    (31, 250, '2020-09-18 23:20:58.932687', 250),
    (31, 251, '2020-09-18 23:20:58.932687', 251),
    (31, 252, '2020-09-18 23:20:58.932687', 252),
    (31, 253, '2020-09-18 23:20:58.932687', 253),
    (31, 254, '2020-09-18 23:20:58.932687', 254),
    (31, 255, '2020-09-18 23:20:58.932687', 255),
    (31, 256, '2020-09-18 23:20:58.932687', 256),
    (31, 257, '2020-09-18 23:20:58.932687', 257),
    (31, 258, '2020-09-18 23:20:58.932687', 258),
    (31, 259, '2020-09-18 23:20:58.932687', 259),
    (31, 260, '2020-09-18 23:20:58.932687', 260),
    (31, 261, '2020-09-18 23:20:58.932687', 261),
    (31, 262, '2020-09-18 23:20:58.932687', 262),
    (31, 263, '2020-09-18 23:20:58.932687', 263),
    (31, 264, '2020-09-18 23:20:58.932687', 264),
    (31, 265, '2020-09-18 23:20:58.932687', 265),
    (31, 266, '2020-09-18 23:20:58.932687', 266),
    (31, 267, '2020-09-18 23:20:58.932687', 267),
    (31, 268, '2020-09-18 23:20:58.932687', 268),
    (31, 269, '2020-09-18 23:20:58.932687', 269),
    (31, 270, '2020-09-18 23:20:58.932687', 270);


--

INSERT INTO "subcategory" ("id", "title", "created_at", "updated_at", "color") VALUES 
 (1, 'Animaux célèbres', '2020-09-18 13:46:45.987518', NULL, '#511515'),
 (5, 'Princesses Disney', '2020-09-18 13:46:45.987518', NULL, '#bd7ec9'),
 (7, 'Comédies Françaises', '2020-09-18 13:46:45.987518', NULL, '#c14040'),
 (8, 'Héros de Star Wars', '2020-09-18 13:46:45.987518', NULL, '#081214'),
 (11, 'Animaux en vrac', '2020-09-18 13:46:45.987518', NULL, '#02354d'),
 (12, 'Les Fourmis', '2020-09-18 13:46:45.987518', NULL, '#160505'),
 (16, 'Villes du Monde', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (20, 'Boissons sans alcool', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (25, 'Stades de Ligue 1', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (28, 'Réseaux sociaux', '2020-09-18 13:46:45.987518', NULL, '#327bf6'),
 (31, 'Télé réalité', '2020-09-18 13:46:45.987518', NULL, '#327bf6');

--

INSERT INTO "tag" ("id", "title", "color", "created_at", "updated_at") VALUES 
    (1, 'Animaux', '#e2e537', '2020-09-18 12:04:53.17534', NULL),
    (2, 'Géographie', '#43a536', '2020-09-18 12:04:53.17534', NULL),
    (3, 'Gastronomie', '#e5af44', '2020-09-18 12:04:53.17534', NULL),
    (4, 'Sports', '#3551a3', '2020-09-18 12:04:53.17534', NULL),
    (6, 'Cinéma', '#449de5', '2020-09-18 12:04:53.17534', NULL),
    (7, 'Cinéma pour enfants', '#ef8bdd', '2020-09-18 12:04:53.17534', NULL),
    (8, 'Télévision', '#38aa95', '2020-09-18 12:22:09.794955', NULL),
    (5, 'Société', '#b4bbc4', '2020-09-18 12:04:53.17534', NULL);

-- 

SELECT pg_catalog.setval('public.score_id_seq', 24, true);


SELECT pg_catalog.setval('public.quiz_answer_id_seq', 270, true);


SELECT pg_catalog.setval('public.quiz_has_subcategory_id_seq', 270, true);


SELECT pg_catalog.setval('public.quiz_id_seq', 270, true);


SELECT pg_catalog.setval('public.subcategory_id_seq', 34, true);


SELECT pg_catalog.setval('public.users_id_seq', 1, false);



ALTER TABLE "answer"
    ADD CONSTRAINT "answer_pkey" PRIMARY KEY (id);

--

ALTER TABLE "quiz_has_subcategory"
    ADD CONSTRAINT "quiz_has_subcategory_pkey "PRIMARY KEY (id);

--

ALTER TABLE "subcategory"
    ADD CONSTRAINT "subcategory_pkey" PRIMARY KEY (id);

--

ALTER TABLE "users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY (id);

--

ALTER TABLE "quiz_has_subcategory"
    ADD CONSTRAINT "quiz_has_subcategory_quizzes_id_fkey" FOREIGN KEY ("quizzes_id") REFERENCES "quiz"(id);

--

ALTER TABLE "quiz_has_subcategory"
    ADD CONSTRAINT "quiz_has_subcategory_subcategory_id_fkey " FOREIGN KEY ("subcategory_id") REFERENCES "subcategory" (id);

COMMIT;