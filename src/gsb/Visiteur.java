package gsb;

import java.util.Date;

public class Visiteur {
	
	private String matVisiteur;
	private String nom;
	private String prenom;

	public Visiteur(String matVisiteur, String nom, String prenom){
		super();
		this.matVisiteur = matVisiteur;
		this.nom = nom;
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getMatVisiteur() {
		return matVisiteur;
	}

	public void setMatVisiteur(String matVisiteur) {
		this.matVisiteur = matVisiteur;
	}

	@Override
	public String toString() {
		return "Visiteur [nom=" + nom + ", prenom="
				+ prenom + ", matVisiteur=" + matVisiteur
				+ "]";
	}

}
