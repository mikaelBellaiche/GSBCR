package gsb;

public class Controleur {
	
	private GuiAppliCR vuePrincipale ;
	private ModeleAppliCR modele ;
	
	/** Créer le controleur
	 * 
	 * @param modele Le modele
	 */
	public Controleur(ModeleAppliCR modele) {
		super();
		System.out.println("[Controleur::Controleur()]");
		this.modele = modele;
	}
	
	/** Obtenir la vue principale
	 * 
	 * @return la vue principale
	 */
	public GuiAppliCR getVuePrincipale() {
		System.out.println("[Controleur::getVuePrincipale()]");
		return vuePrincipale;
	}
	
	/** Modifier la vue principale
	 * 
	 * @param vuePrincipale La vue principale
	 */
	public void setVuePrincipale(GuiAppliCR vuePrincipale) {
		System.out.println("[Controleur::setVuePrincipale()]");
		this.vuePrincipale = vuePrincipale;
	}
	
	/** Obtenir le modele
	 * 
	 * @return le modele
	 */
	public ModeleAppliCR getModele() {
		return modele;
	}
	
	/** Modifier le modele 
	 * 
	 * @param modele Le modele
	 */
	public void setModele(ModeleAppliCR modele) {
		this.modele = modele;
	}
	
	/** Se connecter sur l'application
	 * 
	 */
	public void seConnecter(){
		System.out.println("[Controleur::SeConnecter()]");
		this.vuePrincipale.changerDeVue("Se connecter") ;
	}
	
	/** Se déconnecter de l'application
	 * 
	 */
	public void seDeconnecter(){
		System.out.println("[Controleur::SeDeconnecter()]");
		this.vuePrincipale.changerDeVue("Se deconnecter") ;
	}
	
	/** Quitter l'application
	 * 
	 */
	public void quitterApplication(){
		System.out.println("[Controleur::quitter()]");
		this.vuePrincipale.changerDeVue("Quitter") ;
	}
	
	/** Visualiser la liste des visiteurs
	 * 
	 */
	public void visualiserVisiteurs(){
		System.out.println("[Controleur::visualiserVisiteurs()]");
		this.vuePrincipale.changerDeVue("Liste visiteurs") ;
	}
	
	/** Visualiser la liste des praticiens hésitants
	 * 
	 */
	public void visualiserPraticiensHesitants(){
		System.out.println("[Controleur::visualiserPraticiensHesitants()]") ;
//		this.visualiserModele();
		this.vuePrincipale.changerDeVue("Liste praticiens hesitants");
	}
	
	/** Visualiser la liste de comptes rendus
	 * 
	 */
	public void visualiserComptesRendus(){
		System.out.println("[Controleur::visualiserCompteRendus()]");
		this.vuePrincipale.changerDeVue("Liste comptes-rendus") ;
	}
	/** Visualiser le compte rendu s�lectionn�
	 * 
	 */
	public void visualiserLeCompteRendu(){
		this.vuePrincipale.changerDeVue("Le compte rendu");
	}
	
	/** Tentative de connexion
	 * 
	 * @param login L'identifiant
	 * @param mdp Le mote de passe
	 * @return Vrai si il existe un utilisateur avec cet identifiant et ce mot de passe, siono Faux
	 */
	public boolean tenterConnexion(String login, String mdp){
		 return Authentification.seConnecter(login, mdp);
	}
	
	/** Quitter l'application
	 * 
	 */
	public void quitter(){
		System.exit(0) ;
	}
	
	/** Actualiser la vue des comptes rendus
	 * 
	 */
	public void actualiserCompteRendu(){
		this.vuePrincipale.changerDeVue("Actualiser compte rendu");
	}

//	/** Visualiser les données de la couche "Logique Métier"
//	 * 
//	 */
//	public void visualiserModele(){
//		System.out.println("Controleur::visualiserModele()") ;
//		System.out.println("") ;
//		System.out.println("------------------ Praticiens Hesitants ----------------------------") ;
//		for(Praticien praticien: this.modele.getPraticiensHesitants()){
//			System.out.println(praticien) ;
//		}
//		System.out.println("------------------- Visiteurs -----------------------------") ;
//		for(Visiteur visiteur: this.modele.getVisiteurs()){
//			System.out.println(visiteur) ;
//		}
//		System.out.println("------------------ Comtpes Rendus ----------------------------") ;
//		for(CompteRendu compteRendu : this.modele.getUnCompteRendu()){
//			System.out.println(compteRendu) ;
//		}
//		System.out.println("") ;
//	}

}
