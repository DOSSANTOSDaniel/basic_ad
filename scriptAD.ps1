<#
NOM DU SCRIPT: script_admin_ad.ps1			
*================================================================*
DESCRIPTION:

Ce script va nous permetre de: 

1* créer et suprimer des unités d'organosations
2* créer et suprimer des groupes
3* créer et suprimer des utilisateurs
4* afficher l'arboresence de l'AD
5* affiche les caractéristiques soit user,groupe,ou		
*================================================================*
AUTEUR: Daniel DOS SANTOS < daniel.massy91@gmail.com >			
*================================================================*
DATE DE CREATION: 02/03/2018	
*================================================================*
VERSION INITIALE: V.1.0
*================================================================*   
USAGE: 	PS C:\Users> powershell ./script_admin_ad.ps1
*================================================================*
NOTES: 
     
*================================================================*
POWERSHELL VERSION: 5.1  
*================================================================*
VERSIONS:

09/03/218 --->Controle de l'exinstance et de la création des ou
 
*================================================================*
    RESTE A FAIRE
    ----------------

    1* vérifier l'orthographe
    2* ajouter des commentaires partout
    3* améliorer l'indentation
    4* faire vérifier le script par un debuguer
    5* tester pour voir si les useur ou ou ou group on été bien créés
    6* faire des fonctions
    7* mettre en place un controle de caractères
    8* mettre en place [1] ou [un] ou [I].....
    9* faire un manuel d'utilisation
    10* possibilité de script non intéractif ( cmd -a xxx -b xxx -c xxx )
	11* ne pas permetre les champ vides
	12* afficher la version courante du script dans le script
    
#> 

<#
###########_Création d'une OU

$ou = read-host "Nom de la nouvelle OU"
$atendu = """OU=$ou,DC=efficom,DC=local"""

#_controle de l'existance
if ((dsquery ou dc=efficom,dc=local -name "$ou") -eq "$atendu")
 {
    write-host "L'unité d'organisation existe déjà"
    dsquery ou dc=efficom,dc=local -name "$ou"
    sleep 3
    exit 0
 }
 else
 {
    write-host "création de l'unité d'organisation"
 }

$objDomain = [ADSI]"LDAP://dc=efficom,dc=local"

$objOU = $objDomain.Create("organizationalUnit", "ou=$ou")

$objOU.SetInfo()

sleep 3

#_Controle de création
 if ((dsquery ou dc=efficom,dc=local -name "$ou") -eq "$atendu")
 {
    write-host "L'unité d'organisation a été créé"
 }
 else
 {
    write-host "L'unité d'organisation n'a pas été créé"
 }
 #>

###########_Supréssion d'une OU

$supou = read-host "nom de l'unité a suprimer"

$objDomain = [ADSI]"LDAP://dc=efficom,dc=local"
#$objDomain = GetObject("LDAP://dc=efficom,dc=local")

$objOU = $objDomain.Delete("organizationalUnit", "ou=$supou")

#$objOU.SetInfo(0)

sleep 3



###########_Detail de OU


#################################################################################

###########_Création d'un groupe

###########_Supréssion d'un groupe

###########_Detail de groupe

##################################################################################

###########_Création d'un utilisateur

###########_Supréssion d'un utilisateur

###########_Detail de user

#################################################################################

###########_arborésence générale ou résumé globale
