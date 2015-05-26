package gsb;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Dates {
	
	/** Convertir une date en chaï¿½ne de caractï¿½res
	 * 
	 * @param date La date ï¿½ convertir
	 * @return La date au format "JJ/MM/AAAA"
	 */
	public static String parseDate(GregorianCalendar date){
		int jour = date.get(Calendar.DAY_OF_MONTH) ;
		int mois = date.get(Calendar.MONTH) + 1 ;
		int annee = date.get(Calendar.YEAR) ;
		return String.format("%02d/%02d/%04d",jour,mois,annee) ;
	}
	
	/** Convertir une chaï¿½ne de caractï¿½res en date
	 * 
	 * @param date La chaï¿½ne de caractï¿½res au format "JJ/MM/AAAA"
	 * @return La date
	 */
	public static GregorianCalendar parseString(String date){
		String [] champs = date.split("/") ;
		int jour = Integer.parseInt(champs[0]) ;
		int mois = Integer.parseInt(champs[1]) - 1 ;
		int annee = Integer.parseInt(champs[2]) ;
		return new GregorianCalendar(annee,mois,jour) ;
	}
	
	/** Convertir une date en Calendar
	 * 
	 * @param dateVisite La date ˆ convertir
	 * @return cal La date au format Calendar
	 */
	public static Calendar DateToCalendar(java.util.Date dateVisite){
		Calendar cal = Calendar.getInstance();
		cal.setTime(dateVisite);
		return cal;
	}
	
	/** Vï¿½rifier le format "JJ/MM/AAAA"
	 * @param source La chaï¿½ne sensï¿½e reprï¿½senter une date
	 * @return true si la chaï¿½ne respecte le format "JJ/MM/AAAA" et false dans le cas contraire
	 */
	public static boolean estDate(String source){
		if(source.length() != 10){
			return false ;
		}
		else {
			try {
				int jour = Integer.parseInt(source.substring(0,2)) ;
				int mois = Integer.parseInt(source.substring(3,5)) - 1 ;
				int annee = Integer.parseInt(source.substring(6)) ;
				if(jour >= 1 && mois >= 0 && annee >= 1){
					new GregorianCalendar(annee,mois,jour) ;
					return true ;
				}
				else {
					return false ;
				}
			}
			catch(Exception e){
				return false ;
			}
		}
	}

}
