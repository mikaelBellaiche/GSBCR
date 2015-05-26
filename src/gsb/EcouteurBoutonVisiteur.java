package gsb;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;

public class EcouteurBoutonVisiteur implements ActionListener{
	
	private int row ;
	private int column ;
	private JTable table ;
	private ModeleAppliCR modele;
	private Controleur controleur;

	/** Modifier l'indice de la ligne
	* @param row L'indice de la ligne
	*/
	public void setRow(int row){
		this.row = row ;
	}
	
	/** Modifier l'indice de la colonne
	*
	* @param column L'indice de la colonne
	*/
	public void setColumn(int column){
		this.column = column ;
	}
	
	/** Modifier le tableau
	* @param table Le nouveau tableau
	*/
	public void setTable(JTable table){
		this.table = table ;
	}
	
	/* (non-Javadoc)
	* @see java.awt.event.ActionListener#actionPerformed(java.awt.event.ActionEvent)
	*/
	@Override
	public void actionPerformed(ActionEvent e) {
		System.out.println("[EcouteurBoutonVisiteur::actionPerformed()]") ;
		
		controleur = ((ModeleListeVisiteurs)this.table.getModel()).getControleur() ;
		modele = ((ModeleListeVisiteurs)this.table.getModel()).getModele();
		
		String matricule = ((ModeleListeVisiteurs)this.table.getModel()).getMatVisiteur(this.row) ;
		String nom = ((ModeleListeVisiteurs)this.table.getModel()).getNom(this.row) ;
		String prenom = ((ModeleListeVisiteurs)this.table.getModel()).getPrenom(this.row) ;
		
		switch(this.column){
			case 3 :
				
				System.out.println("---------------------------");
				System.out.println("[Click on buton Visiteur 'choisir']");
				
				JLabel moisLabel = new JLabel("Mois (Format MM) : ");
				JTextField moisField = new JTextField();
				JLabel anneeLabel = new JLabel("Année (Format AAAA) : ");
				JTextField anneeField = new JTextField();
				Object affichageBoxChoixMoisAnnee [] = {"Sélectionnez le mois et l'année des comptes-rendus à visualiser pour " + prenom + " " + nom , moisLabel, moisField, anneeLabel, anneeField};
				Object options [] = {"Valider", "Annuler"};
				int boxChoixMoisAnnee = JOptionPane.showOptionDialog(null,affichageBoxChoixMoisAnnee, "Période", JOptionPane.OK_CANCEL_OPTION,JOptionPane.INFORMATION_MESSAGE,null,options,null);
			    
				if(JOptionPane.OK_OPTION==boxChoixMoisAnnee){
					System.out.println(moisField.getText()+ " " +anneeField.getText()+ " " + matricule.toString() );
					modele.getComptesRendus(moisField.getText(),anneeField.getText(),matricule);
					controleur.visualiserComptesRendus();
				}
				else {
					JOptionPane.showMessageDialog(null, "Une erreur est survenue. Veuillez réessayer.");
				}
			
		    break ;
		}
	}

}
