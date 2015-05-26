package gsb;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Date;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
	
public class EcouteurBoutonCompteRendus implements ActionListener {
		
		private int row ;
		private int column ;
		private JTable table ;
		private ModeleAppliCR modele;
		private Controleur controleur ;
		
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
			System.out.println("[EcouteurBoutonCompteRendus::actionPerformed()]") ;
			controleur = ((ModeleListeCompteRendus)this.table.getModel()).getControleur() ;
			modele = ((ModeleListeCompteRendus)this.table.getModel()).getModele();
			
			int numCompteRendu =((ModeleListeCompteRendus)this.table.getModel()).getNumero(row);
			String prenomPraticien = ((ModeleListeCompteRendus)this.table.getModel()).getPrenomPra(row);
			String bilan = ((ModeleListeCompteRendus)this.table.getModel()).getBilan(row);
			String nomPraticien = ((ModeleListeCompteRendus)this.table.getModel()).getNom(row);
			Date dateRedac = ((ModeleListeCompteRendus)this.table.getModel()).getDateRedac(row);
			Date dateVisite = ((ModeleListeCompteRendus)this.table.getModel()).getDateVisite(this.row);
			
//			String bilanCompteRendu = ((ModeleListeCompteRendus)this.table.getModel()).getBilan(this.row) ;
//			String nomPra = ((ModeleListeCompteRendus)this.table.getModel()).getNom(this.row);
//			Date dateRedaction = ((ModeleListeCompteRendus)this.table.getModel()).getDateRedac(this.row);
//			Date dateVisite = ((ModeleListeCompteRendus)this.table.getModel()).getDateVisite(this.row);
//			int numCompteRendu = ((ModeleListeCompteRendus)this.table.getModel()).getNumCompteRendu(this.row);
			
			JTextArea crTextArea = new JTextArea();
			crTextArea.setText("Prénom/Nom du praticien : " + prenomPraticien +" "+nomPraticien + "\n" + "Numéro du rapport : " + numCompteRendu + "\n" + "Date de rédaction : " + dateRedac + "\n" + "Date de visite : " + dateVisite + "\n" + "Bilan : " + bilan );
			crTextArea.setColumns(50);
			crTextArea.setRows(7);
			crTextArea.setOpaque(false);
			crTextArea.setEditable(false);
			crTextArea.setLineWrap(true);
			crTextArea.setWrapStyleWord(true);
			JScrollPane crSp = new JScrollPane(crTextArea);
			
			switch(this.column){
			case 6 :
				System.out.println("[----------------------------------------]") ;
				System.out.println("[Bouton clique Compte rendu]") ;
				controleur.actualiserCompteRendu();
				JOptionPane.showMessageDialog(null,crSp,"Compte rendu",JOptionPane.CLOSED_OPTION);
				modele.setLu(numCompteRendu);
				
			break;
			}
		}

}
