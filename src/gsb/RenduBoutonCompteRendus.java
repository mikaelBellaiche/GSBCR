package gsb;

import java.awt.Component;

import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.table.TableCellRenderer;

public class RenduBoutonCompteRendus extends JButton implements
TableCellRenderer {

	@Override
	public Component getTableCellRendererComponent(JTable table, Object value,
		boolean isSelected, boolean hasFocus, int row, int column) {
	
		if (value != null) {
			this.setText(value.toString());
		} else {
			this.setText("");
		}
	return this;
	}
}