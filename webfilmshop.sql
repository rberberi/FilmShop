-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 20. Jun 2019 um 16:06
-- Server-Version: 10.1.40-MariaDB
-- PHP-Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `webfilmshop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE `accounts` (
  `ACCID` int(11) NOT NULL COMMENT 'Account-ID',
  `ACCNAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL COMMENT 'Account-Name',
  `ACCPWD` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL COMMENT 'Account-Password'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `accounts`
--

INSERT INTO `accounts` (`ACCID`, `ACCNAME`, `ACCPWD`) VALUES
(1, 'kbeike', 'kbeike123'),
(2, 'mwinkel', 'mwinkel123'),
(3, 'mmeyer', 'mmeyer123'),
(4, 'bschneider', 'bschneider123'),
(5, 'ineustadt', 'ineustadt123'),
(6, 'slemann', 'slemann123'),
(7, 'mschweizer', 'mschweizer123'),
(8, 'mfruehauf', 'mfruehauf123'),
(9, 'cschmid', 'cschmid123'),
(10, 'mmaier', 'mmaier123'),
(11, 'kfarber', 'kfarber123'),
(20, 'rberberi', 'tirana94'),
(21, 'aabb', 'aabb'),
(22, 'asdf123', '12345'),
(23, 'mberberi', '1234567'),
(24, 'szeit', '1234'),
(25, 'mohsen1001', '123'),
(26, 'neuekunde', '1234'),
(27, 'mmusterman', 'mmusterman1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestelldetail`
--

CREATE TABLE `bestelldetail` (
  `BDID` int(5) NOT NULL COMMENT 'Bestelldetail-ID',
  `FK_BID` int(5) NOT NULL COMMENT 'Fremdschlüssel-Bestellung',
  `FK_FID` int(5) NOT NULL COMMENT 'Fremdschlüssel-Film',
  `BDDatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bestelldetail-Datum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `bestelldetail`
--

INSERT INTO `bestelldetail` (`BDID`, `FK_BID`, `FK_FID`, `BDDatum`) VALUES
(1, 1, 44, '2019-05-16 13:05:25'),
(2, 2, 14, '2019-05-16 13:05:25'),
(3, 3, 31, '2019-05-16 13:05:25'),
(4, 3, 43, '2019-05-16 13:05:25'),
(5, 4, 46, '2019-05-16 13:05:25'),
(6, 5, 54, '2019-05-16 13:05:25'),
(7, 6, 28, '2019-05-16 13:05:25'),
(8, 7, 1, '2019-05-16 13:05:25'),
(9, 8, 35, '2019-05-16 13:05:25'),
(10, 9, 39, '2019-05-16 13:05:25'),
(11, 10, 27, '2019-05-16 13:05:25'),
(12, 10, 30, '2019-05-16 13:05:25'),
(13, 11, 48, '2019-05-16 13:05:25'),
(14, 11, 52, '2019-05-16 13:05:25'),
(15, 11, 41, '2019-05-16 13:05:25'),
(16, 12, 3, '2019-05-16 13:05:25');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `BID` int(6) NOT NULL COMMENT 'Bestell-ID',
  `BLieferDat` date NOT NULL COMMENT 'Bestell-Lieferdatum',
  `FK_KID` int(5) NOT NULL COMMENT 'Fremdschlüssel-Kunde',
  `BAendDat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Bestell-Änderungsdatum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`BID`, `BLieferDat`, `FK_KID`, `BAendDat`) VALUES
(1, '2019-04-15', 1, '2019-05-16 12:57:35'),
(2, '2019-03-11', 7, '2019-05-16 12:57:35'),
(3, '2019-04-05', 3, '2019-05-16 12:57:35'),
(4, '2019-03-24', 11, '2019-05-16 12:57:35'),
(5, '2019-02-13', 6, '2019-05-16 12:57:35'),
(6, '2019-03-09', 3, '2019-05-16 12:57:35'),
(7, '2019-03-01', 9, '2019-05-16 12:57:35'),
(8, '2019-05-01', 3, '2019-05-16 12:57:35'),
(9, '2019-02-27', 4, '2019-05-16 12:57:35'),
(10, '2019-03-27', 9, '2019-05-16 12:57:35'),
(11, '2019-01-09', 1, '2019-05-16 12:57:35'),
(12, '2019-04-11', 8, '2019-05-16 12:57:35');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `filme`
--

CREATE TABLE `filme` (
  `FID` int(5) NOT NULL COMMENT 'Produkt-ID',
  `FName` varchar(100) CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL COMMENT 'Filmname',
  `FJahr` int(11) NOT NULL COMMENT 'Film-Erscheinungsjahr',
  `FPreisNetto` decimal(7,2) NOT NULL COMMENT 'Filmpreis',
  `FK_FGenID` int(5) NOT NULL COMMENT 'Fremdschlüssel-Filmgenre',
  `FInhalt` longtext CHARACTER SET utf8 COLLATE utf8_german2_ci COMMENT 'Film-Inhalt',
  `FAendDat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Änderungsdatum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `filme`
--

INSERT INTO `filme` (`FID`, `FName`, `FJahr`, `FPreisNetto`, `FK_FGenID`, `FInhalt`, `FAendDat`) VALUES
(1, 'Aquaman', 2017, '14.99', 1, '\"Aquaman\" offenbart die Anfänge von Arthur Curry, halb Mensch, halb Atlanter, und schickt ihn auf eine unglaubliche Reise, bei der er sich nicht nur sich selbst, sondern auch seiner Bestimmung stellen muss. Wird er sich würdig erweisen und zum neuen König von Atlantis gekrönt werden?', '2019-05-16 11:24:27'),
(2, 'John Wick: Kapitel 2', 2017, '5.99', 1, 'John Wick ist ein weiteres Mal dazu gezwungen, aus seinem Ruhestand zurückzukehren: Ein ehemaliger Kollege wurde damit beauftragt, die Kontrolle über eine mysteriöse, international agierende Organisation von Auftragskillern zu erlangen. Ein alter Blutschwur verpflichtet John, ihm dabei zu helfen. Er reist nach Rom, wo er gegen einige der tödlichsten Killer der Welt antreten muss.', '2019-05-16 11:28:22'),
(3, 'The Commuter', 2018, '7.99', 1, 'Der Versicherungsmakler und ehemalige Polizist Michael McCauley (Liam Neeson) pendelt schon seit 10 Jahren regelmäßig mit dem Zug von seinem kleinen Vorort in die Großstadt New York – und das jeden Tag zur gleichen Zeit. Eines Tages taucht die mysteriöse Joanna (Vera Farmiga) auf und stört diese Routine. Michael merkt schnell, dass diese Frau sich nicht ohne Grund zu ihm in das Abteil gesetzt hat: sie verspricht ihm eine hohe Belohnung, wenn er eine bestimmte Person an Bord des Zuges findet. Für diese Aufgabe erhält er von Joanne nur zwei Informationen: einen falschen Namen und das Ziel des Reisenden. Sollte Micheal sich weigern, diese Mission zu erfüllen, geraten nicht nur alle weiteren Passagiere in Gefahr, sondern auch seine eigene Familie. Erschwerend kommt hinzu, dass ihm nur eine Stunde bis zur Endstation der Reise bleibt. ', '2019-05-16 11:28:22'),
(4, 'James Bond 007: Ein Quantum Trost', 2008, '10.99', 1, 'Nach dem Verrat von Vesper Lynd und ihrem gewaltsamen Tod hat James Bond seine letzte Mission noch nicht abgeschlossen. Bei einem Verhör offenbart Mr. White, dass die Organisation Quantum, die hinter Vespers Tod steht, komplexer und größer ist als geahnt. Die Spuren eines Verräters aus eigenen Reihen bringen Bond nach Haiti, wo er die geheimnisvolle Camille kennenlernt. Diese führt den Agent mit Doppel-Null-Status zu dem Geschäftsmann Dominic Greene. Greene entpuppt sich als große Nummer bei Quantum und hat vor, mit Hilfe seiner Verbindungen das Regime eines lateinamerikanischen Landes zu entmachten und selbst die Kontrolle zu übernehmen.', '2019-05-16 11:33:29'),
(5, 'Avengers: Age of Ultron', 2014, '11.99', 1, 'Die Avengers blasen zum Angriff – der finstere Hydra-Anführer Baron von Strucker (Thomas Kretschmann, Eichmann) hat das Zepter von Loki in seine Gewalt gebracht und will es für böse Zwecke einsetzen. Die kosmische Macht des Artefakts hat er bereits dazu verwendet, die Zwillinge Pietro (Aaron Taylor-Johnson, Godzilla) und Wanda (Elizabeth Olsen, Liberal Arts) mit Superkräften auszustatten und auf das Team loszulassen. Trotzdem können die Helden den Baron besiegen und das Zepter wieder an sich bringen.', '2019-05-16 11:33:29'),
(11, 'Bohemian Rhapsody', 2018, '16.99', 2, 'Farrokh Bulsara, besser bekannt unter seinem späteren Künstlernamen Freddie Mercury (gespielt von Rami Malek), tritt 1970 der Band Smile bei. Schnell fällt der charismatische und extravagante junge Mann mit seinem unglaublichen Gesangstalent auf. Aufgrund ihres unkonventionellen und experimentellen Stils nimmt der erfolgreiche Musikmanager John Reid die Band unter Vertrag. Die vier Männer aus Großbritannien werden im Laufe der Zeit unter dem Namen Queen weltweit bekannt und beliebt. Der Rest ist Musikgeschichte.\r\n\r\nDer Film beschäftigt sich nicht nur mit dem musikalischen Werdegang der Band, die ihren Höhepunkt beim Live Aid-Konzert 1985 hatte, sondern auch mit den zahlreichen Streitereien mit Produzenten und untereinander und den Einzelschicksalen der Bandmitglieder – insbesondere mit dem Leben ihres Frontmanns Freddie Mercury. Bei ihm steht nicht nur die Entwicklung zum überlebensgroßen Rockstar im Mittelpunkt, sondern ebenso seine Auseinandersetzung mit der eigenen Sexualität – angefangen bei der heterosexuellen Verlobung mit Mary Austin (Lucy Boynton) über sein Outing vor seiner Familie, hin zu seiner HIV-Erkrankung.', '2019-05-16 11:52:43'),
(12, 'American History X', 1998, '7.99', 2, 'Nach dem Tod seines Vaters mutiert der noch jugendliche Derek Vinyard (Edward Norton; Fight Club, Der unglaubliche Hulk) zum gefürchtetsten Neonazi der Stadt. In mitreißenden Hetz-Reden radikalisiert er bei Dosenbier und Rockmusik seine Skinhead-Freunde weiter. In Schwarz-Weiß-Bildern zeigt Regisseur Tony Kaye (Snowblind, Detachment) den Hass auf Fremdes und Unbekanntes auf den kalifornischen Straßen, der unter den Skinheads ebenso grassiert wie bei den anderen ethnischen Gruppen und Gangs in der Stadt.', '2019-05-16 11:52:43'),
(13, 'War Dogs', 2016, '9.99', 2, '\"War Dogs\" basiert auf der wahren Geschichte von zwei Freunden Anfang 20, die während des Irak-Kriegs in Miami Beach leben und eine wenig bekannte staatliche Regelung ausnutzen, nach der sich auch kleine Firmen um amerikanische Rüstungsaufträge bewerben dürfen. Nach bescheidenen Anfängen sprudelt plötzlich das Geld und erlaubt den beiden ein Leben in Saus und Braus. Doch dann verheben sie sich kräftig: Sie sichern sich einen 300 Millionen schweren Auftrag und sollen der afghanischen Armee Waffen liefern.', '2019-05-16 11:52:43'),
(14, 'Cast Away - Verschollen', 2000, '8.99', 2, 'Als Controller der Transportfirma FedEx sorgt Chuck Noland dafür, dass der weltweite Zustellbetrieb reibungslos funktioniert. Entsprechend häufig ist er in alle Ecken der Erde unterwegs. Auf einer dieser Dienstreisen stürzt die Frachtmaschine mit Noland an Bord mitten über dem Pazifik während eines Unwetters ab. Mit letzter Kraft schleppt er sich auf ein entlegenes Eiland. Doch seine Freude, die Katastrophe überstanden zu haben, währt nur kurz: Noland ist der einzige Überlebende, und die Insel, auf die er sich gerettet hat, unbewohnt.', '2019-05-16 11:52:43'),
(15, 'Les Misérables', 2012, '8.99', 2, 'Frankreich im 19. Jahrhundert: Unter falschem Namen gelingt dem ehemaligen Sträfling Jean Valjean der Aufstieg zum angesehenen Fabrikbesitzer. In einer Notsituation nimmt er Cosette, die Tochter der Arbeiterin Fantine, bei sich auf und eröffnet ihr ein Leben in Wohlstand. Doch die Vergangenheit holt Valjean immer wieder ein in Gestalt des Polizeibeamten Javert, der gnadenlos Jagd auf ihn macht. Als sich die junge Cosette mitten in einer blutigen Straßenrevolte Hals über Kopf in den charmanten Revolutionär Marius verliebt, droht Valjeans Tarnung endgültig aufzufliegen. Wird er sich und die jungen Liebenden retten können?', '2019-05-16 11:52:43'),
(16, 'Johnny English: Man lebt nur dreimal', 2018, '9.99', 3, 'Durch einen mysteriösen Hackerangriff werden sämtliche britischen Undercover-Agenten enttarnt. Nur Johnny English, der sich der Digitalisierung aufgrund mangelnder Fähigkeiten erfolgreich widersetzen konnte, ist übrig. Es bleibt keine andere Wahl, als ausgerechnet den Spion zu reaktivieren, der bisher jede seiner Missionen vermasselt hat. Mit seinen kompromisslos analogen Methoden wird Johnny English zur letzten Hoffnung des Geheimdienstes Ihrer Majestät.', '2019-05-16 11:58:59'),
(17, 'Beim ersten Mal', 2007, '8.99', 3, 'Der lebensfrohe Ben ist kein Kind von Traurigkeit. In einer Bar lernt er die bildschöne Allison kennen und nach ein paar gemeinsamen Drinks landen sie zusammen im Bett. Das böse Erwachen folgt acht Wochen später, als Ben das Mädchen erstmals wiedertrifft und von ihr erfährt, dass sie schwanger ist von ihm. Nach anfänglichem Hadern beschließen die beiden, es dem Baby zuliebe mit einer Beziehung zu versuchen und damit gehen die Probleme auch schon los ...', '2019-05-16 11:58:59'),
(18, 'Why Him?', 2016, '9.99', 3, 'Der überfürsorgliche Vater Ned besucht gemeinsam mit Frau und Sohn die Tochter in den College-Ferien. Dort trifft er auf seinen größten Alptraum, ihren Freund Laird, einen sozial völlig untauglichen Silicon-Valley-Milliardär, der sein Herz aber auf dem rechten Fleck hat. Neds Hilflosigkeit, sich in Lairds glamouröser High-Tech-Welt zurechtzufinden, verwandelt sich schnell in blanke Panik. Denn ausgerechnet Laird will seiner Tochter einen Heiratsantrag machen.', '2019-05-16 11:58:59'),
(19, 'Unterwegs mit Mum', 2012, '8.49', 3, 'Andy ist Erfinder eines organischen Putzmittels - jahrelang hat er an diesem bahnbrechenden Produkt geforscht. Die einzige Person, die er bisher von diesem für die Umwelt und den Menschen unschädlichen Reinigungsmittel überzeugen konnte: seine Mutter Joyce. Doch so leicht gibt er nicht auf und begibt sich auf eine Geschäftsreise quer durchs ganze Land, um seine Erfindung endlich an den Mann bzw. die Frau zu bringen. Und wer wäre eine bessere Begleitung für die 3000 Meilen lange Fahrt als seine Mutter? Nicht ganz uneigennützig ist diese Idee, schließlich möchte er die lebensfrohe aber alleinstehende Witwe auf andere Gedanken bringen.', '2019-05-16 11:58:59'),
(20, 'Der Kaufhaus Cop', 2009, '7.99', 3, 'Paul Blart hat schon immer davon geträumt, Polizist zu werden. Dieser Traum zerplatzt, als die Sportprüfung der Polizeiakademie zur unbezwingbaren Hürde wird. Doch dann bekommt Blart die Chance, im örtlichen Einkaufszentrum als Wachmann zu arbeiten. Ganz in seinem Element, nimmt er seine Aufgabe, für die öffentliche Sicherheit zu sorgen, mehr als ernst. Als ein paar Rowdies das Kaufhaus überfallen, ist Blarts großer Tag gekommen und er macht den Störenfrieden, die seine Tochter und seine Traumfrau als Geisel genommen haben, einen Strich durch die Rechnung ...', '2019-05-16 11:58:59'),
(21, 'Wunder', 2017, '7.99', 4, 'Der kleine August „Auggie“ Pullman (Jacob Tremblay) ist zehn Jahre alt, humorvoll, klug und äußerst großzügig. Er hat eine wunderbare Familie: seine Mutter Isabel (Julia Roberts), Vater Nate (Owen Wilsen) und seine große Schwester Olivia (Izabela Vidovic). Auggie leidet seit seiner Geburt unter einem seltenen Gendefekt, der sein Gesicht entstellt. Aufgrund dessen musste er schon einige Operationen über sich ergehen lassen und wird von klein auf von seiner Mutter zu Hause unterrichtet. Da er nun alt genug ist, um auf eine weiterführende Schule zu gehen, melden ihn seine Eltern auf der Privatschule „Beecher Prep“ an.\r\n\r\nNach anfänglicher Skepsis nimmt Auggie all seinen Mut zusammen und beschließt, sich den Abenteuern zu stellen, die das Leben für einen so außergewöhnlichen Jungen wie ihn bereithält.', '2019-05-16 12:07:12'),
(22, 'High School Musical 2', 2007, '6.99', 4, 'High School Musical 2, und es gibt wieder jede Menge zu feiern - mit heißen Hits und coolen Moves! Die East High Wildcats erleben einen unvergesslichen Sommer. Troy ist aufgeregt, als er einen Job im Country Club von Sharpays Eltern angeboten bekommt. Doch das gehört zu Sharpays Plan! Sie versucht, Troy und Gabriella auseinanderzubringen. Ob ihr das gelingen wird? Am Abend der Talentshow kommt es zum Showdown.', '2019-05-16 12:07:12'),
(23, 'Die Insel der besonderen Kinder', 2016, '9.99', 4, 'Als der 16-jährige Jake verschiedene Hinweise findet, die Realität und Zeit auf rätselhafte Weise auf den Kopf zu stellen scheinen, entdeckt er einen geheimen Zufluchtsort für Kinder mit außergewöhnlichen Fähigkeiten, \"Die Insel der besonderen Kinder\". Jake und seine neuen Freunde, wie die schwebende Emma und der unsichtbare Millard, müssen sich unmittelbar drohenden Gefahren stellen und vermeintlich übermächtige Feinde bekämpfen, um eine Welt zu beschützen, die genauso besonders ist wie sie selbst.', '2019-05-16 12:07:12'),
(24, 'Die Chroniken von Narnia: Prinz Kaspian', 2008, '7.99', 4, 'Auf magische Weise sind die Pevensie-Geschwister in die sagenhafte Welt Narnia zurückgekehrt. Zwischenzeitlich sind 1300 Jahre vergangen. Das Goldene Zeitalter ist erloschen, das Reich wurde von den Telmarines erobert und der böse König Miroz hat die Herrschaft übernommen. Gemeinsam mit Narnias rechtmäßigen Thronfolger, dem Prinzen Kaspian, nehmen die vier Geschwister und die Bewohner Narnias den Kampf gegen das Böse auf ...', '2019-05-16 12:07:12'),
(25, 'Mrs. Doubtfire - Das stachelige Kindermädchen', 1993, '9.99', 4, 'Der Stimmenimitator Daniel Hillard tollt mit seinen drei Kindern durchs Haus, liest ihnen Geschichten mit verschiedenen Stimmen vor und holt zum Kindergeburtstag Tiere aus dem Zoo. Seine Frau Miranda, eine ehrgeizige Innenarchitektin, hat für die Eskapaden und die Unordnung kein Verständnis, sie reicht die Scheidung ein. Weil Daniel gerade arbeitslos ist, erhält sie das Sorgerecht, und ihr Ex-Mann darf die Kinder nur noch samstags sehen. Damit findet er sich nicht ab: Von seinem Bruder Frank, einem Maskenbildner, lässt er sich in die mütterliche \"Mrs. Doubtfire\" verwandeln und bewirbt sich auf eine Anzeige von Miranda als Kinderfrau.', '2019-05-16 12:07:12'),
(26, 'Unknown User: Dark Web', 2018, '11.99', 5, 'Als der 20-Jährige Matias einen Laptop in einem Café mitgehen lässt, muss er schnell feststellen, dass etwas mit diesem Gerät nicht stimmt. Denn während eines Skype-Spieleabends mit seinen Freunden entdeckt er versteckte Dateien im Zwischenspeicher und stellt diese wieder her - ein Fehler, den er schon bald bereut. Unwissentlich werden die Freunde in die Tiefen des Darknet gezogen und grausame Videos tauchen auf ihren Bildschirmen auf. Als sich plötzlich ein anonymer User einhackt, wird der Abend zum reinsten Horror. Wie weit wird der Hacker gehen, um die Geheimnisse des Darknet zu schützen?', '2019-05-16 12:12:16'),
(27, 'Annabelle', 2014, '7.99', 5, 'Kalifornien im Jahr 1969: Das junge Ehepaar John (Ward Horton) und Mia Form (Annabelle Wallis, Die Tudors) erwartet ihr erstes Kind. Eines Tages überrascht John seine Frau mit einer Porzellan-Puppe, welche die begeisterte Sammlerin schon seit langem gesucht hatte. Kurz darauf werden sie eines Nachts aufgeschreckt, als zwei Satansanbeter erst ihre Nachbarn brutal abschlachten und dann sie angreifen. Nachdem es John gelingt, den männlichen Angreifer zu töten, bringt sich seine Gefährtin um, die Puppe in ihren Händen. Wie sie später erfahren, war ihr Name Annabelle Higgins.', '2019-05-16 12:12:16'),
(28, 'The Witch', 2015, '5.99', 5, '1630: Der tiefreligiöse Farmer William lebt mit seiner Frau Katherine und seinen fünf Kindern am Rande eines düsteren Waldes. Als ihr neugeborener Sohn spurlos verschwindet und es zu Missernten kommt, gerät die älteste Tochter Thomasin in den Verdacht, eine Hexe zu sein.', '2019-05-16 12:12:16'),
(29, 'Stephen Kings Es', 1990, '7.99', 5, '30 Jahre nachdem eine Gruppe von Jugendfreunden \"Es\", das in der Gestalt des mörderischen Clowns Pennywise personifizierte Böse, besiegt hat, ist ihr Einsatz erneut notwendig. Die Freunde von einst, die sich im Laufe der Jahre aus den Augen verloren haben, werden von dem einzigen, der in ihrer Heimatstadt geblieben ist, zusammengerufen: \"Es\" ist wieder aktiv. In Derry, Maine muß ein jeder von ihnen seinen ganz persönlichen Alptraum durchleben, bevor sich die Gruppe auf ihre einstige Stärke, den bedingungslosen Zusammenhalt, besinnt. In einer gigantischen Höhle unter der Stadt stellen sie das Ungeheuer zu einem letzten Kampf.', '2019-05-16 12:12:16'),
(30, 'Saw III', 2006, '6.99', 5, 'Der Jigsaw Killer lädt zum dritten perversen Spiel auf Leben und vor allem Tod. Während die Polizei weiterhin nach Jigsaw fahndet, hat der dahinsiechende Sadist mit seiner Gefolgsfrau Amanda bereits die nächste Runde seines perversen Spiels eingeläutet: Amanda entführt die Ärztin Dr. Lynn Denlon nach einer ihrer Schichten im Krankenhaus und bringt sie in ein leerstehendes Lagerhaus: Dort soll sie Jigsaw so lange am Leben erhalten, wie sein neues Opfer Jeff braucht, eine Reihe von Aufgaben auf Leben und Tod zu lösen.', '2019-05-16 12:12:16'),
(31, 'The Accountant', 2016, '9.99', 6, 'Christian Wolff ist ein Mathematik-Fachmann, der mit Zahlen deutlich besser zurechtkommt als mit Menschen. Unter der Tarnung einer kleinstädtischen Steuerberatung arbeitet er als Buchhalter für einige der gefährlichsten Unterweltorganisationen der Welt. Doch die Steuerfahndungsabteilung des Finanzministeriums unter Leitung von Ray King kommt ihm auf die Spur.', '2019-05-16 12:25:25'),
(32, 'Siberia - Tödliche Nähe', 2018, '11.99', 6, 'Lucas Hill, ein nicht ganz lupenreiner Diamantenhändler, fliegt nach Russland, um dem mafiösen Oligarchen Boris Volkov einige extrem seltene Edelsteine zu verkaufen. Doch Hills Kontaktmann vor Ort ist verschwunden und mit ihm die kostbare Ware. Um diese wiederzubeschaffen, muss Lucas ins frostige Sibirien reisen, wo ihm Katya, die weltgewandte Besitzerin einer kleinen Bar, bald aus tödlicher Bedrängnis hilft. Denn ein Mann wie Volkov verzeiht keine Fehler und seine Leibwächter kennen kein Erbarmen, wenn es um krumme Deals, verletzte Ehre und Rache geht.', '2019-05-16 12:25:25'),
(33, 'Der Til Schweiger Tatort: Der große Schmerz ', 2015, '7.99', 6, 'Ein Jahr nach dem erfolgreichen Schlag gegen den Astan Clan verläuft das Leben ruhiger für Nick Tschiller. Er und Gümer sind ein eingespieltes Team und endlich ist mehr Zeit für Tochter Lenny. Doch mit der Ruhe ist es jäh vorbei, denn Firat Astan soll aus dem Gefängnis heraus weiter agieren. Als ein Freund von Nick stirbt und seine Exfrau und Tochter verschwinden, ist schnell klar, dass nur Astan dahinter stecken kann. Und was für ein Ziel verfolgt die schöne mysteriöse Auftragskillerin Leya? Es beginnt ein mörderischer Wettlauf mit der Zeit, in dem Tschiller zu allen Mitteln greifen muss ...', '2019-05-16 12:25:25'),
(34, 'BlacKkKlansman', 2018, '9.99', 6, 'Die frühen 1970er-Jahre: Der junge Polizist Ron Stallworth tritt als erster Afroamerikaner seinen Posten als Kriminalbeamter im Police Department von Colorado Springs an. Entschlossen, sich einen Namen zu machen, startet der unerschrockene Cop eine aberwitzige und gefährliche Mission: den Ku-Klux-Klan zu infiltrieren und bloßzustellen. Als der Undercover-Einsatz zunehmend komplexer wird, bekommt Ron Hilfe von seinem Kollegen Flip Zimmerman. Gemeinsam wollen sie die extremistische Organisation zu Fall zu bringen.', '2019-05-16 12:25:25'),
(35, 'The Guilty', 2018, '11.99', 6, 'Asger Holm ist ehemaliger Polizist, sitzt jetzt aber in der Notrufzentrale. Eines Tages erhält er einen Anruf einer entführten Frau. Als die Verbindung plötzlich abbricht, beginnt die Suche nach der Vermissten und ihrem Entführer. Asgers einzige Waffe dabei ist das Telefon. In einem Wettlauf gegen die Zeit versucht er, die Frau ausfindig zu machen. Doch schon bald muss Asger feststellen, dass er es mit einem Verbrechen zu tun hat, das weit grössere Ausmasse annimmt als es anfangs den Anschein gemacht hat.', '2019-05-16 12:25:25'),
(36, 'Der König der Löwen', 1994, '11.99', 7, 'Als König Mufasa und Königin Sarabi einen Sohn gebären, wird er ihrem Volk in der Savannah als König Simba präsentiert und von Schamanenaffe Rafiki gesalbt. Ihm ist eine große Zukunft vorbestimmt und als Sohn des mächtigen Königs genießt er ein Leben voller Privilegien und Glückseligkeit.', '2019-05-16 12:30:31'),
(37, 'Coco - Lebendiger als das Leben!', 2017, '12.99', 7, 'Miguel macht sich auf eine außergewöhnliche Reise in das magische Land seiner Ahnen. Dort wird ihm der sympathische Schwindler Hector unverhofft zum Freund und hilft ihml dabei, die Geheimnisse um die Geschichten und Traditionen seiner Ahnen zu lüften.', '2019-05-16 12:30:31'),
(38, 'Lilo & Stitch', 2002, '9.99', 7, 'Er ist raffiniert, er ist gefährlich, er ist absolut schräg und er kommt aus einer anderen Galaxie: Stitch, Ergebnis eines illegalen Experiments - ein Außerirdischer im Hundepelz. Nach einer Odyssee im Weltraum landet er ausgerechnet auf der Trauminsel Hawaii und trifft dort auf Lilo. Lilo ist ein freches kleines Mädchen, das Surfen liebt und einfach anders ist als alle Kinder um sie herum. Ihre Leidenschaft: Elvis-Songs. Das etwas seltsame Aussehen und Benehmen von Stitch fasziniert Lilo so sehr, dass sie kurzerhand beschließt, ihn zu adoptieren. Eine Entscheidung, die ihr Leben auf den Kopf stellt ...', '2019-05-16 12:30:31'),
(39, 'Drachenzähmen leicht gemacht', 2010, '8.99', 7, 'Der kleine Wikinger Hicks lebt auf der Insel Berk, auf der tagein tagaus gegen Drachen gekämpft wird. Eines Tages kommt es jedoch dazu, dass er einem Drachen das Leben rettet. Die beiden freunden sich an, was Hicks Vater, das Stammesoberhaupt der Gemeinschaft, gar nicht erfreut. Sein Sohn verstößt damit gegen die Wikingerehre. Diese sieht ausschließlich das Bekämpfen von Drachen vor. Doch Hicks lässt sich davon nicht beirren und nimmt den Kampf gegen die Ausrottung der Drachen auf ...', '2019-05-16 12:30:31'),
(40, 'Aladdin', 1992, '9.99', 7, 'Nichts macht Aladdin lieber, als über Dächer zu springen und gemeinsam mit seinem lustigen Äffchen Abu griesgrämige Händler auszutricksen. Trotzdem träumt er von einem anderen Leben, seit er Jasmin, die Tochter des Sultans, kennen gelernt hat. Eines Tages gelangt er in den Besitz einer Wunderlampe, und die hat es wirklich in sich: einen gigantischen, unendlich ausgeflippten Flaschengeist namens Dschinni, der seinem Besitzer drei Wünsche erfüllen kann. Aber auch der hinterhältige Großwesir Dschafar kennt die Macht der Lampe.', '2019-05-16 12:30:31'),
(41, 'Guardians of the Galaxy', 2014, '11.99', 8, 'Dem Schmuggler Peter Quill (Chris Pratt; Die Kunst zu gewinnen - Moneyball) fällt ein Relikt von unschätzbarem Wert in die Hände. Wer den Infinity-Stein besitzt, kann mit seiner Energie den gesamten Kosmos unterwerfen. Kein Wunder also, dass das halbe Universum hinter dem Stein her ist. Bald zieht Peter die Aufmerksamkeit einiger Kopfgeldjäger auf sich.', '2019-05-16 12:35:16'),
(42, 'Pirates of the Caribbean: Salazars Rache', 2017, '11.99', 8, 'Jack Sparrow (Johnny Depp) ist wieder da. Diesmal legt er einen glanzvollen Auftritt beim Raub eines gigantischen Stadttresors hin. Natürlich kriegt er wieder Hilfe von seiner unverbesserlichen Crew rund um den verschrobenen Mister Gibbs (Kevin McNally) - vor dem Galgen rettet ihn jedoch der junge Sohn von William Turner, Henry (Brenton Thwaites), der sich in die schöne Astronomin Carina (Kaya Scodelario) verschaut hat, die wegen Hexerei ebenfalls am Galgen baumeln soll.\r\n\r\nGemeinsam mit Captain Barbossa (Geoffrey Rush) macht sich der ungleiche Trupp aus unterschiedlichsten Gründen auf die Jagd nach dem Dreizack des Poseidon. Carina hat von ihrem verschollenen Vater Hinweise auf den Verbleib des magischen Artefakts bekommen, Henry will seinen Vater (Orlando Bloom) vom Fluch der Flying Dutchman befreien und Jack braucht die Waffe, um gegen seinen erbittertsten Widersacher antreten zu können: Kapitän Salazar (Javier Bardem). Der einstige spanische Piratenjäger ist durch eine Finte Jacks mit seiner Crew in einer verfluchten Bucht gefangen und dazu verdammt, als Untoter ewig nach Rache zu dürsten. Doch Jack lässt seinen Feind aus Versehen frei – und muss wieder einmal um sein Leben segeln.', '2019-05-16 12:35:16'),
(43, 'Der Hobbit - Eine unerwartete Reise', 2012, '9.99', 8, 'Die erfolgreichste Kino-Trilogie der letzten Jahre findet hier ihren Anfang. 60 Jahre vor den Ereignissen aus Der Herr der Ringe, machen sich Gandalf der graue Zauberer, 12 Zwerge und Ihr König Thorin Eichenschild mit dem Hobbit Bilbo Beutlin auf den Weg zu neuen Abenteuern. Gemeinsam versuchen sie das verlorene Königreich der Zwerge zurück zu erobern. Vor Jahren vertrieb der Drache Smaug das Volk der Zwerge aus ihrer Heimat, dem Berg Erebor. Seitdem herrscht der feuerspeiende Drache über das Reich und hat sich in der ehemaligen Schatzkammer des Königreichs eingenistet.', '2019-05-16 12:35:16'),
(44, 'Godzilla', 2014, '7.99', 8, 'In Godzilla 2014 stapfen mal wieder gigantische Monster aus fremden Welten über die Erde. Godzilla 2014 ist jedoch kein Remake des Klassikers aus dem Jahre 1954, sondern eine Neuinterpretation. Auch mit der Verfilmung von Roland Emmerich (Godzilla, Independence Day) von 1998 hat Godzilla 2014 nichts zu tun.', '2019-05-16 12:35:16'),
(45, 'Gattaca', 1997, '5.99', 8, 'Vincent ist ein Mensch zweiter Klasse. Auf natürlichem Wege geboren, aber anfällig für Krankheiten, eignet er sich nicht dazu, ins Raumfahrtprogramm der Organisation Gattaca aufgenommen zu werden - doch genau das ist sein Traum. So nimmt er die Identität eines anderen an und schleicht sich in den Konzern ein. Das Ziel vor Augen, droht ihn ein Gewaltakt zu vernichten. Vincent könnte nicht nur als Betrüger entlarvt, sondern auch als Unschuldiger für einen Mord verurteilt werden ...', '2019-05-16 12:35:16'),
(46, 'A Star is Born', 2018, '14.99', 9, 'Der trinkende Country-Sänger Jackson Maine (Bradley Cooper) ist am Höhepunkt seiner Karriere, als er die schüchterne Kellnerin Ally (Lady Gaga) in einer Bar kennenlernt. Er stellt fest, dass Ally ein musikalisches Ausnahmetalent ist und lädt sie, nach einer gemeinsamen Nacht, zu einem seiner Konzerte ein. Dort kann Jack die schüchterne Frau davon überzeugen, zusammen mit ihm im Duett aufzutreten und ein selbst komponiertes Lied zu singen. Nach dem erfolgreichen Auftritt, erlebt Ally einen kometenhaften Aufstieg, während Jacksons Erfolg sich langsam dem Ende neigt. Er versinkt daher immer mehr in Selbstmitleid und wendet sich dem Alkohol zu, worunter die Liebe der beiden extrem leidet. ', '2019-05-16 12:40:23'),
(47, 'Lieber verliebt', 2009, '6.99', 9, 'Noch vor kurzem führte Sandy ein beschauliches Leben als Vorstadt-Hausfrau und glückliche Mutter. Aber jetzt steht die attraktive 40jährige plötzlich vor den Scherben ihrer Existenz: Ihr Mann hat eine Affäre! Und Sandy ist alles andere als bereit, sich das bieten zu lassen. Da trifft es sich gut, dass Aram, der smarte Kellner aus dem Coffee Shop um die Ecke, nicht nur ein verständnisvoller Zuhörer ist, sondern auch gut mit Kindern umgehen kann. Fortan kümmert sich Aram fürsorglich um Sandys Nachwuchs - und nebenbei auch immer öfter um deren fesche Mutti. Warum auch nicht? Sandy sieht gut aus, ist sexy und wieder zu haben ...', '2019-05-16 12:40:23'),
(48, 'Ein Rezept für die Liebe', 2018, '9.99', 9, 'Nikki ist eine talentierte, aufstrebende Chefköchin in London. Als sie nach Hause zu dem Pizzashop ihrer Familie in Little Italy zurückkehrt, lässt sie eine Romanze mit einem Freund aus ihrer Kindheit, Leo, wiederaufleben. Aber da gibt es ein Hauptproblem: er ist der Sohn von dem Erzfeind ihrer Familie in dem Pizzageschäft. Während ihre Familien sich im Krieg befinden, halten sie ihre Beziehung geheim, aber ebenso wenig wissen sie dass ihre Mütter heimlich beste Freundinnen sind und ihre Großeltern ihr eigenes Liebesverhältnis verbergen!', '2019-05-16 12:40:23'),
(49, 'Der Klang des Herzens', 2007, '4.99', 9, 'Lyla ist eine Ausnahme-Cellistin, Louis ein irischer Rockmusiker. Eine einzige, magische Nacht über den Dächern von New York ändert für beide alles. Aber Lylas ehrgeiziger Vater trennt die Liebenden voneinander. Schlimmer noch: Als die hochschwangere Lyla einen Unfall erleidet, lässt er sie in dem Glauben, sie habe eine Fehlgeburt erlitten. Einige Jahre später schlägt sich ein kleiner Junge als Straßenmusiker durch den Big Apple. Er nennt sich August Rush und erfreut mit seinem außergewöhnlichen Talent die Passanten am Washington Square. Das erregt auch die Neugier des zwielichtigen Vagabunden Wizard ...', '2019-05-16 12:40:23'),
(50, 'Before Sunrise', 1995, '7.99', 9, 'Im Zug von Budapest nach Paris lernen sich der Amerikaner Jesse und die französische Studentin Celine kennen. Jesse überredet seine neue Bekannte, mit ihm in Wien auszusteigen. Während eines langen, romantischen Spaziergangs durch die fremde Stadt wird ihnen klar, dass sie sich ineinander verliebt haben. Doch kann es für die beiden Reisenden eine Zukunft geben?', '2019-05-16 12:40:23'),
(51, 'Desperado', 1995, '7.99', 10, 'Mit einem bis zum Rand mit Schusswaffen gefüllten Gitarrenkoffer zieht \"El Mariachi\" quer durch Mexiko. Auf der Suche nach dem Gangsterboss Bucho, der für den Tod seiner Geliebten verantwortlich ist, pflastern mehrere Dutzend Leichen seinen Weg. Am Ziel angekommen, verliebt sich der schweigsame Held in die rassige Dorfschönheit Carolina - doch für zärtliche Stunden zu zweit bleibt keine Zeit, denn jetzt ist es Zeit für Rache ...', '2019-05-16 12:44:51'),
(52, 'Für ein paar Dollar mehr', 1965, '7.99', 10, 'Die Kopfgeldjäger Monco und Colonel Mortimer sind hinter dem mexikanischen Banditen El Indio her. Da auf den Gangster ein besonders hohes Kopfgeld ausgesetzt ist, beschließen die beiden, gemeinsame Sache zu machen. Monco spielt den Lockvogel und befreit einen Vertrauten Indios aus dem Gefängnis. Doch Indio bleibt misstrauisch: Während er eine Bank in El Paso ausraubt, schickt er Monco zu einem fingierten Überfall nach Santa Cruz ...', '2019-05-16 12:44:51'),
(53, 'Django Unchained', 2012, '7.99', 10, 'Der Sklave Django (Jamie Foxx; White House Down, Collateral) lebt ein bitteres Leben in Ketten, getrennt von seiner geliebten Frau Broomhilda (Kerry Washington; Ray, Der letzte König von Schottland). Als er auf den Düsseldorfer Kopfgeldjäger und Zahnarzt Dr. King Schultz (Christoph Waltz; Inglourious Basterds, Der Gott des Gemetzels) trifft, wendet sich sein Schicksal. Dr. King Schultz befreit Django und verspricht ihm die Freiheit zu schenken, wenn er ihm hilft, die Verbrecherbande der Brittle Brüder zu finden. Django kennt die Gesichter der Bande nur zu gut. Aber Django hat noch ein großes Ziel vor Augen: Er will seine Frau Broomhilda finden und retten.', '2019-05-16 12:44:51'),
(54, 'A Million Ways to Die in the West', 2014, '8.99', 10, 'Im Wilden Westen im Jahr 1882 sind nur harte Kerle gefragt. Dumm nur, dass der Schafhirte Albert (Seth MacFarlane, Ted, Zahnfee auf Bewährung) ein absoluter Feigling ist. Im kleinen Städtchen Old Stump ist Albert zwar für sein loses Mundwerk bekannt, er geht aber jeder Konfrontation aus dem Weg und ist noch dazu ein miserabler Schütze.', '2019-05-16 12:44:51'),
(55, 'The Hateful 8', 2015, '9.99', 10, 'Vier zwielichtige Menschen mit undurchsichtigen Absichten befinden sich in einer Postkutsche auf dem Weg nach Red Rock. Es schneit im Wyoming der 1870er Jahre und die Stimmung ist geladen. An Bord der Kutsche befinden sich die Kopfgeldjäger John Ruth (Kurt Russell, Poseidon) und Marquis Warren (Samuel L. Jackson), der früher als Soldat seinem Land diente; Ruths schlagfertige Gefangene Daisy (Jennifer Jason Leigh, Road to Perdition) und der vermeintliche neue Sheriff von Red Rock, Chris Mannix (Walton Goggins, Predators). Ein heftiger Schneesturm zwingt die ungleichen Reisenden Rast zu machen und so finden sie Zuflucht in einer Hütte mit dem klangvollen Namen Minnies Kurzwarenladen. Die ausgesuchte Unterkunft hat bereits Flüchtenden Unterschlupf geboten: Dem Mexikaner Bob (Demián Bichir, Taffe Mädels), dem undurchschaubaren Oswaldo Mobray (Tim Roth, Lie to Me), dem Cowboy Joe Gage (Michael Madsen, Sin City) und dem gealterten Südstaaten-General Sanford Smithers (Bruce Dern, Nebraska).', '2019-05-16 12:44:51');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `filmgenre`
--

CREATE TABLE `filmgenre` (
  `FGenID` int(5) NOT NULL COMMENT 'Genre-ID',
  `FGenName` varchar(50) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL COMMENT 'Genrename'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `filmgenre`
--

INSERT INTO `filmgenre` (`FGenID`, `FGenName`) VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Komödie'),
(4, 'Family'),
(5, 'Horror'),
(6, 'Krimi'),
(7, 'Zeichentrick'),
(8, 'Fantasy'),
(9, 'Romantik'),
(10, 'Western');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `KID` int(5) NOT NULL COMMENT 'Kunden-ID',
  `KVName` varchar(40) COLLATE latin1_general_ci NOT NULL COMMENT 'Kunden-Vorname',
  `KName` varchar(40) COLLATE latin1_general_ci NOT NULL COMMENT 'Kunden-Nachname',
  `KEmail` varchar(100) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Kunden-Email',
  `KTel` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Kunden-Telefonnummer',
  `FK_ACCID` int(11) NOT NULL COMMENT 'Fremdschlüssel-KundenAccount'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`KID`, `KVName`, `KName`, `KEmail`, `KTel`, `FK_ACCID`) VALUES
(1, 'Kristian', 'Beike', 'KristianBeike@einrot.com', '09122 86 79 56', 1),
(2, 'Marko', 'Winkel', 'MarkoWinkel@cuvox.de', '05704 49 46 28', 2),
(3, 'Marcel', 'Meyer', 'MarcelMeyer@cuvox.de', '0355 57 62 44', 3),
(4, 'Bernd', 'Schneider', 'BerndSchneider@einrot.com', '06771 45 15 84', 4),
(5, 'Ines', 'Neustadt', 'InesNeustadt@cuvox.de', '089 75 73 24', 5),
(6, 'Sabine', 'Lemann', 'SabineLemann@einrot.com', '04754 11 85 57', 6),
(7, 'Mike', 'Schweizer', 'MikeSchweizer@cuvox.de', '06641 10 36 86', 7),
(8, 'Martina', 'Fruehauf', 'MartinaFruehauf@cuvox.de', '0761 95 91 38', 8),
(9, 'Christin', 'Schmid', 'ChristinSchmid@cuvox.de', '07623 83 87 82', 9),
(10, 'Maik', 'Maier', 'MaikMaier@einrot.de', '07623 23 57 82', 10),
(11, 'Karin', 'Farber', 'KarinFarber@cuvox.de', '09836 73 33 01', 11),
(12, 'Marko', 'Berberi', 'mberberi@gmail.com', '012333456', 23),
(13, 'Sommer', 'Zeit', 'szeit@web.de', '11223344', 24),
(14, 'moh', 'pour', '', '01565543', 25),
(15, 'Kunde', 'Neue', '', '123456', 26),
(16, 'Max', 'Musterman', 'mmusterman@web.de', '0158774477', 27);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ACCID`),
  ADD UNIQUE KEY `ACCNAME` (`ACCNAME`);

--
-- Indizes für die Tabelle `bestelldetail`
--
ALTER TABLE `bestelldetail`
  ADD PRIMARY KEY (`BDID`),
  ADD KEY `FK_BID` (`FK_BID`),
  ADD KEY `FK_FID` (`FK_FID`) USING BTREE;

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `FK_KID` (`FK_KID`);

--
-- Indizes für die Tabelle `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`FID`),
  ADD KEY `FK_FGenID` (`FK_FGenID`);

--
-- Indizes für die Tabelle `filmgenre`
--
ALTER TABLE `filmgenre`
  ADD PRIMARY KEY (`FGenID`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`KID`),
  ADD KEY `FK_ACCID` (`FK_ACCID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ACCID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Account-ID', AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `bestelldetail`
--
ALTER TABLE `bestelldetail`
  MODIFY `BDID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Bestelldetail-ID', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `BID` int(6) NOT NULL AUTO_INCREMENT COMMENT 'Bestell-ID', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `filme`
--
ALTER TABLE `filme`
  MODIFY `FID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Produkt-ID', AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `filmgenre`
--
ALTER TABLE `filmgenre`
  MODIFY `FGenID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Genre-ID', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `KID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Kunden-ID', AUTO_INCREMENT=17;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bestelldetail`
--
ALTER TABLE `bestelldetail`
  ADD CONSTRAINT `bestelldetail_ibfk_1` FOREIGN KEY (`FK_FID`) REFERENCES `filme` (`FID`),
  ADD CONSTRAINT `bestelldetail_ibfk_2` FOREIGN KEY (`FK_BID`) REFERENCES `bestellung` (`BID`);

--
-- Constraints der Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `bestellung_ibfk_2` FOREIGN KEY (`FK_KID`) REFERENCES `kunde` (`KID`);

--
-- Constraints der Tabelle `filme`
--
ALTER TABLE `filme`
  ADD CONSTRAINT `filme_ibfk_1` FOREIGN KEY (`FK_FGenID`) REFERENCES `filmgenre` (`FGenID`);

--
-- Constraints der Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD CONSTRAINT `kunde_ibfk_1` FOREIGN KEY (`FK_ACCID`) REFERENCES `accounts` (`ACCID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
