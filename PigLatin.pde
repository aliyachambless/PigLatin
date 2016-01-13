import java.util.*;
ArrayList<String> hymnWords = new ArrayList<String>();
public void setup() {
	String lines[] = loadStrings("words.txt");
	String hymnLines[] = loadStrings("LowellHymn.txt");
	for(int i = 0; i < hymnLines.length; i++){
		int begin = 0;
		for(int x = 0; x < hymnLines[i].length(); x++){
			if(hymnLines[i].charAt(x) == ' ' || hymnLines[i].charAt(x) == ','){
				hymnWords.add(hymnLines[i].substring(begin,x));
				hymnWords.add(hymnLines[i].substring(x,x+1));
				begin = x+1;
			}
		}
	}
	System.out.println("there are " + lines.length + " lines in words.txt");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
	for (int i = 0 ; i < hymnWords.size(); i++) {
	  System.out.print(hymnWords.get(i));
	}
	System.out.println(" ");
	for(int i = 0; i < hymnWords.size(); i++){
		if(hymnWords.get(i).length() > 1){
			System.out.print(pigLatin(hymnWords.get(i)));
		}
		else{
			System.out.print(hymnWords.get(i));
		}
	}
}
public void draw()
{
	
}
public int findFirstVowel(String sWord){
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	if(sWord.length() > 0){
		for(int i = 0; i < sWord.length(); i++){
			if(sWord.charAt(i) == 'a' || sWord.charAt(i) == 'e' || sWord.charAt(i) == 'i' || sWord.charAt(i) == 'o' || sWord.charAt(i) == 'u')
				return i;
		}
		return -1;
	}
	else{
		return -1;
	}
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0){
		return sWord + "way";
	}
	else if(sWord.substring(0,2).equals("qu")){
		return sWord.substring(2,sWord.length()) + "quay";
	}
	else if(findFirstVowel(sWord) > 0){
		return sWord.substring(findFirstVowel(sWord), sWord.length()) + sWord.substring(0,findFirstVowel(sWord)) + "ay";
	}
	else
	{
		return "ERROR!";
	}
}
