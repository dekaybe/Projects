
cat <<- END_HERE |
	Aarti	
	Abdelhafid	
	Abdul	
	Abigail	
	Adam	2
	adedoyin	
	Aditya	
	Adrian	2
	Adrienne	1
	Afaz	
	Agnes	1
	Agnieszka	
	Ahlam	
	Ahmed	
	Alan	2
	Alessandra	1
	Alexander	1
	Ali	1
	Alice	1
	Alicia	1
	Alison	1
	Allan	2
	Amrita	
	Amy	1
	Andreas	
	Andrew	2
	Anil	
	Anita	1
	Anna	1
	Annu	
	Anthony	2
	Antonio	2
	Ashish	
	Ashlee	
	Ashok	
	Ashritha	
	Atanu	
	Augustine	
	Barry	2
	Basil	2
	Bea	
	Benham	
	Birgit	1
	Bolarinde	
	Brigitte	1
	Bruce	2
	Bryony	1
	Cariad	
	Carl	2
	Caroline	1
	Catherine	1
	Cathryn	1
	Charles	2
	Charlotte	1
	Charmaine	
	Chhama	
	Chika	
	Christopher	2
	Chuh	
	Claire	1
	Clare	1
	Claudia	1
	Colin	2
	Conrad	2
	Daniel	2
	Darrel	2
	Darren	2
	Daryl	2
	David	2
	Deborah	1
	Deepa	
	Deirdre	1
	Devraj	
	Dilys	
	Dimitrios	
	Dipti	
	Duncan	2
	Edward	2
	Effrosyni	
	Eithne	
	Eleanor	1
	Eleni	
	Elizabeth	1
	Emma	1
	Esther	1
	Eugenia	1
	Evette	1
	Fleur	1
	Fraser	2
	Gabriel	2
	Gabriela	1
	Gail	1
	Gayle-Claire	1
	Geoffrey	2
	George	2
	Georgia	1
	Gerasimos	
	Gillian	1
	Graham	2
	Grenville	2
	Guirong	
	Hannah	1
	Harold	2
	Hasan	
	Hassan	
	Hazel	
	Heidi	
	Helen	1
	Hiang	
	Hilary	1
	Hossein	
	Iain	2
	Ian	2
	James	2
	Jane	1
	Janet	1
	Jason	2
	Jeanne	1
	Jen	1
	Jennifer	1
	Jessica	1
	Jill	1
	Joanna	1
	Joanne	1
	Joel	2
	Johann	2
	John	2
	Jonathan	2
	Julia	1
	Kalid	
	Karen	1
	Karine	
	Karl	2
	Kate	1
	Katherine	1
	Kathryn	1
	Katie	1
	Keith	2
	Kenneth	2
	Kevin	2
	Keyvan	
	Kieran	2
	Kimon	
	Kirill	
	Kirrili	
	Kristof	2
	Larissa	1
	Laura	1
	Laurence	2
	Laurie	
	Lee	
	Linda	1
	Lindsay	1
	Lone	
	Lorenza	
	Lorraine	1
	Lucy	1
	Ludmila	
	Luigina	
	Luke	2
	Lynda	1
	Maciej	
	Madhawi	
	Malcolm	2
	Mandy	1
	Margaret	1
	Marguerite	1
	Maria	1
	Marios	2
	Mark	2
	Markus	2
	Martin	2
	Mary	1
	Matthew	2
	Maureen	1
	Meher	
	Melchiorre	
	Michael	2
	Michelle	1
	Miguel	2
	Mike	2
	Mireille	
	Mohammad	2
	Mohammed	2
	Nadejda	
	Naomi	
	Nasrin	
	Natasha	1
	Naveena	
	Navin	
	Nazar	
	Neme	
	Nicholas	2
	Nicola	1
	Nikoletta	
	Nina	
	Ning	
	Nyra	
	Olena	
	Oliver	2
	Olivia	
	Oyeyemi	
	Padmavadee	
	Panagiota	
	Patricia	1
	Patrick	2
	Paul	2
	Peter	2
	Philip	2
	Philippa	1
	Phillip	2
	Pooja	
	Pramod	
	Rachael	1
	Rachel	1
	Raja	
	Rajesh	
	Ramen	
	Rebecca	1
	Ria	
	Ricardo	2
	Richard	2
	Robert	2
	Robin	2
	Roderick	2	
	Roger	2
	Ronald	2
	Roopa	
	Rosalind	1
	Roseleen	1
	Rosemary	1
	Roxanna	1
	Ruchika	
	Rupa	
	Ruth	1
	Sabela	
	Sachin	2
	Sally	1
	Samuel	2
	Sandra	1
	Sanjan	
	Sara	1
	Sarah	1
	Sarah-Jane	1
	Sarath	
	Sardar	
	Saurabh	
	Scot	2
	Sebastien	2
	Shah	
	Shamim	
	Shishu	
	Shubnum	
	Sidhartha	
	Simeon	2
	Simon	2
	Simona	
	Solomon	2
	Sonia	1
	Sophia	1
	Stephanie	1
	Stephen	2
	Steven	2
	Stuart	2
	Sun	
	Susan	1
	Suzanne	1
	Svetomir	
	Syed	
	Tejal	
	Terence	2
	Thejavanthi	
	Thomas	2
	Timothy	2
	Tomas	2
	Unoke	
	Valasia	
	Vanessa	1
	Vidyanand	
	Vijayalakshmi	
	Vikram	
	Wendy	1
	Yama	
	Yennunanda	
	Yulia	1
END_HERE
while read a b 
do
   [[ $b ]] && 
   {
     k="$k UPDATE srgp_voters_root SET g_id=$b WHERE v_Forename=\"$a\"; \n"
	 }
done 

echo "$k" | mysql -uadmin -ppassword srgp
