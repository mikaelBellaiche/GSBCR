package gsb;

import java.sql.Date;

public class CompteRendu {
	
	 private int numero;
	    private Date dateRedac;
	    private Date dateVisite;
	    private String bilan;
	    private String nomPra;
	    private String prenomPra;
	    private String villePra;
	    private String matriculeVis;
	    private Byte lu ;
	    public static final String LU = "Oui";
	    public static final String NON_LU = "Non";
	    
	   /** CrÃ©ation d'un compte rendu
	    * 
	    * @param numero Le numÃ©ro du compte rendu
	    * @param dateRedac La date de rÃ©daction du compte rendu
	    * @param dateVisite La date de visite du compte rendu
	    * @param bilan Le bilan du compte rendu
	    * @param motif Le motif du compte rendu
	    * @param nomPra Le nom du praticien du compte rendu
	    * @param villePra La ville du praticien du compte rendu
	    * @param nomVis Le nom du visiteur du compte rendu
	    * @param lu Le compte rendu a Ã©tÃ©/n'a pas Ã©tÃ© consultÃ©
	    */
	    public CompteRendu(int numero, Date dateRedac, Date dateVisite, String bilan, String nomPra, String prenomPra, String villePra, String matriculeVis, Byte lu){
	        this.numero = numero;
	        this.dateRedac = dateRedac;
	        this.dateVisite = dateVisite;
	        this.bilan = bilan;
	        this.nomPra = nomPra ;
	        this.prenomPra = prenomPra;
	        this.villePra = villePra;
	        this.matriculeVis = matriculeVis;
	        this.lu = lu ;
	        
	    }


	    /** Obtenir le numï¿½ro du rapport de visite
	     *
	     * @return le numero du rapport
	     */
	    public int getNumero() {
	        return numero;
	    }
	   
	    /** Modifier le numï¿½ro du rapport de visite
	     *
	     * @param numero le numero du rapport
	     */
	    public void setNumero(int numero) {
	        this.numero = numero;
	    }
	   
	    /** Obtenir la date du rapport de visite
	     *
	     * @return la date du rapport
	     */
	    public Date getDateRedac() {
	        return dateRedac;
	    }
	   
	    /** Modifier la date du rapport de visite
	     *
	     * @param date la date du rapport
	     */
	    public void setDateRedac(Date dateRedac) {
	        this.dateRedac = dateRedac;
	    }
	    
	    /** Obtenir la date du rapport de visite
	    *
	    * @return la date du rapport
	    */
	   public Date getDateVisite() {
	       return dateVisite;
	   }
	  
	   /** Modifier la date du rapport de visite
	    *
	    * @param date la date du rapport
	    */
	   public void setDateVisite(Date dateVisite) {
	       this.dateVisite = dateVisite;
	   }
	   
	    /** Obtenir le bilan du rapport de visite
	     *
	     * @return le bilan du rapport
	     */
	    public String getBilan() {
	        return bilan;
	    }
	   
	    /** Modifier le bilan du rapport de visite
	     *
	     * @param bilan le bilan du rapport
	     */
	    public void setBilan(String bilan) {
	        this.bilan = bilan;
	    }
	    
	    /** Obtenir le nom du praticien
	     *  
	     * @return Le nom du praticien
	     */
	    public String getNomPra() {
	    	return nomPra;
	    }
	    	
	    /** Modifier le nom du praticien du rappot
	     * 
	     * @param nomPra Le nouveau nom du praticien du rapport
	     */
	    public void setNomPra(String nomPra) {
	    	this.nomPra = nomPra;
	    }
	    
	    /** Obtenir le prénom du praticien
	     *  
	     * @return Le prénom du praticien
	     */
	    public String getPrenomPra() {
	    	return prenomPra;
	    }
	    	
	    /** Modifier le prénom du praticien du rappot
	     * 
	     * @param nomPra Le nouveau prénom du praticien du rapport
	     */
	    public void setPrenomPra(String prenomPra) {
	    	this.prenomPra = prenomPra;
	    }
	    
	    /** Obtenir la ville du praticien
	     * 
	     * @return La ville du praticien
	     */
	    public String getVillePra() {
	    	return villePra;
	    }
	    
	    /** Modifier la ville du praticien du rapport
	     * 
	     * @param villePra La ville du praticien du rapport
	     */
	    public void setVillePra(String villePra) {
	    	this.villePra = villePra;
	    }

	    /** Obtenir le matricule du visiteur du rapoort
	     * 
	     * @return Le matricule du visiteur
	     */
	    public String getMatriculeVis() {
	    	return matriculeVis;
	    }
	    
	    /** Modifier le matricule du visiteur du rapport
	     * 
	     * @param matriculeVis Le matricule du visiteur
	     */
	    public void setMatriculeVis(String matriculeVis) {
	    	this.matriculeVis = matriculeVis;
	    }
	    
	    /** Obtenir l'état du rapport
	     * 
	     * @return L'état du rapport
	     */
	    public Byte getLu(){
	    	return lu ;
	    }
	    
	    /** Modifier l'état du rapport
	     * 
	     * @param lu L'état du rapport
	     */
	    public void setLu(Byte lu){
	    	this.lu = lu ;
	    }
	    
//	    /** Indique si un compte-rendu est lu
//	    *
//	    * @return true si le compte-rendu est lu, sinon false
//	    */
//	    public boolean isLu(){
//		    if(this.lu == "Oui"){
//		    	return true ;
//		    }
//		    else {
//		    	return false ;
//		    }
//	    }
//	    
//	    /** Indique si un compte-rendu n'est pas lu
//	    *
//	    * @return true si le compte-rendu n'est pas lu sinon false
//	    */
//	    public boolean isNotLu(){
//	    	if(this.lu == "Non"){
//	    		return true;
//	    	}
//	    	else{
//	    		return false;
//	    	}
//	    }
	    
	    public String toString() {
			return "CompteRendu [numero=" + numero + ", dateRedac=" + dateRedac
					+ ", dateVisite=" + dateVisite + ", bilan=" + bilan
					+ ", nomPra=" + nomPra + ", villePra="
					+ villePra + ", matriculeVis=" + matriculeVis + ", lu=" + lu + "]";
		}

}
