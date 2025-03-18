-- PostgreSQL version of MySQL dump
 -- Table structure for table "categorie"

DROP TABLE IF EXISTS "categorie" CASCADE;


CREATE TABLE "categorie" ("categorie_id" SERIAL PRIMARY KEY,
                                                        "nom" varchar(50) DEFAULT NULL);

-- Dumping data for table "categorie"

INSERT INTO "categorie" ("categorie_id",
                         "nom")
VALUES (1,
        'Standard'),(2,
                     'Special'),(3,
                                 'JeunesConducteurs');

-- Reset the sequence to the max id + 1

SELECT setval(pg_get_serial_sequence('categorie', 'categorie_id'), 4, false);

-- Table structure for table "produit"

DROP TABLE IF EXISTS "produit" CASCADE;


CREATE TABLE "produit" ("produit_id" SERIAL PRIMARY KEY,
                                                    "nom" varchar(50) DEFAULT NULL,
                                                                              "description" varchar(255) DEFAULT NULL,
                                                                                                                 "cout" int DEFAULT NULL);

-- Dumping data for table "produit"

INSERT INTO "produit" ("produit_id",
                       "nom",
                       "description",
                       "cout")
VALUES (1,
        'AssuranceAuTiersSimple',
        'Assurance couvrant uniquement les dégats matériels et corporels que vous êtes susceptible de causer à autrui avec votre véhicule.',
        500),(2,
              'AssuranceAuTiersEtendue',
              'Assurance couvrant le minimum de la garantie responsabilité civile et le bris de glace, le vol, l''attentat, les catastrophes naturelles et technologiques',
              800),(3,
                    'AssuranceTousRisques',
                    'Assurance qui reprend les garanties de l''assurance au tiers étendue et auxquelles on ajoute la garantie dommage tous accidents (responsable ou non).',
                    1500),(4,
                           'AssuranceTousRisquesJeunes',
                           'L''assurance tous risques pour les jeunes conducteurs (- 2 ans de permis de conduire)',
                           2200);

-- Reset the sequence to the max id + 1

SELECT setval(pg_get_serial_sequence('produit', 'produit_id'), 5, false);

-- Table structure for table "categorie_produit"

DROP TABLE IF EXISTS "categorie_produit";


CREATE TABLE "categorie_produit"
    ("categorie_id" int NOT NULL,
                        "produit_id" int NOT NULL,
                                         PRIMARY KEY ("categorie_id",
                                                      "produit_id"), CONSTRAINT "categorieid"
     FOREIGN KEY ("categorie_id") REFERENCES "categorie" ("categorie_id") ON DELETE CASCADE ON UPDATE CASCADE,
                                                                                                      CONSTRAINT "produit_id"
     FOREIGN KEY ("produit_id") REFERENCES "produit" ("produit_id") ON DELETE CASCADE ON UPDATE CASCADE);

-- Create index for produit_id in categorie_produit

CREATE INDEX "produitid_idx" ON "categorie_produit" ("produit_id");

-- Dumping data for table "categorie_produit"

INSERT INTO "categorie_produit"
VALUES (1,
        1),(1,
            2),(1,
                3),(3,
                    4);

-- Table structure for table "commentaire"

DROP TABLE IF EXISTS "commentaire";


CREATE TABLE "commentaire"
    ("commentaire_id" SERIAL PRIMARY KEY,
                                     "contenu" varchar(255) DEFAULT NULL,
                                                                    "produit_id" int NOT NULL,
                                                                                     CONSTRAINT "produitid"
     FOREIGN KEY ("produit_id") REFERENCES "produit" ("produit_id") ON DELETE CASCADE ON UPDATE CASCADE);

-- Create index for produit_id in commentaire

CREATE INDEX "commentaire_produitid_idx" ON "commentaire" ("produit_id");

-- Dumping data for table "commentaire"

INSERT INTO "commentaire" ("commentaire_id",
                           "contenu",
                           "produit_id")
VALUES (1,
        'Assurance avec un bon rapport qualité prix',
        2),(2,
            'Minimum du minimum, un peu deçu',
            1),(3,
                'Ce qu''on peut attendre d''une assurance au tiers, ni plus, ni moins',
                1),(4,
                    'Excellente assurance tous risques ! Prix compétitif vis à vis des autres assureurs',
                    3),(5,
                        'L''assurance est bien, mais les délais de traitement ne me conviennent pas, trop d''attente!',
                        3);

-- Reset the sequence to the max id + 1

SELECT setval(pg_get_serial_sequence('commentaire', 'commentaire_id'), 6, false);

