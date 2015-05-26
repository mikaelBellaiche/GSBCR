package gsb;

import java.awt.Color;
import java.awt.Component;

import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JTable;

public class EditeurBoutonVisiteur extends DefaultCellEditor  {
	
	private static final long serialVersionUID = 1L;
	protected JButton bouton ;
	private boolean isPushed ;
	private EcouteurBoutonVisiteur ecouteur = new EcouteurBoutonVisiteur() ;
	
	/** Cr�er l'�diteur
	*
	* @param checkBox La case � cocher associ�e au bouton
	*/
	public EditeurBoutonVisiteur(JCheckBox checkBox) {
		super(checkBox);
		
		
		this.bouton = new JButton() ;
		this.bouton.setOpaque(true) ;
		this.bouton.addActionListener(this.ecouteur) ;
	}
	
	/* (non-Javadoc)
	* @see javax.swing.DefaultCellEditor#getTableCellEditorComponent(javax.swing.JTable, java.lang.Object, boolean, int, int)
	*/
	@Override
	public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int row, int column) {
		System.out.println("[EditeurBoutonVisiteurs::getTableCellEditorComponent()]") ;
		this.ecouteur.setRow(row) ;
		this.ecouteur.setColumn(column) ;
		this.ecouteur.setTable(table) ;
		if(value == null){
			this.bouton.setText("") ;
		}
		else {
			this.bouton.setText(value.toString()) ;
			bouton.setBackground(Color.RED);
		}
		return this.bouton ;
	}

}
