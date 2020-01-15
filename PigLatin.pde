public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public int findVowels(String sWord)
//If there are no vowels, returns 0
//If the word starts with vowel(s), return 1
{
	boolean isVowels = false;
	if (sWord.substring(0,1).equals("a") || sWord.substring(0,1).equals("e") ||sWord.substring(0,1).equals("i") ||sWord.substring(0,1).equals("o") ||sWord.substring(0,1).equals("u")) 
	{
		return 1;
	}
	for(int j = 0; j < sWord.length()-1; j++)
	{
		if (sWord.substring(j,j+1).equals("a") || sWord.substring(j,j+1).equals("e") || sWord.substring(j,j+1).equals("i") || sWord.substring(j,j+1).equals("o") || sWord.substring(j,j+1).equals("u"))
		{
			return 2;
		}
	}
	return 0;
}

public int findQU(String sWord)
//return 1 if it starts with qu
//return 0 if it does not start with qu
{
	if(sWord.substring(0,2).equals("qu")) 
	{
		return 1;
	}
	return 0;
}

public int findStartConsonant(String sWord) 
{
	int numConsonant = 0;
	for(int k = sWord.length(); k > 1; k--)
	{
		if (sWord.substring(k-1,k).equals("a") || sWord.substring(k-1,k).equals("e") || sWord.substring(k-1,k).equals("i") || sWord.substring(k-1,k).equals("o") || sWord.substring(k-1,k).equals("u"))
		{
			numConsonant = 0;
		}
		else
		{
			numConsonant = numConsonant + 1;
		}

	}
	return numConsonant;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if (findQU(sWord) == 1) 
	{
		return sWord.substring(2, sWord.length()) + "quay";
	}
	if(findVowels(sWord) == 0)
	{
		return sWord + "ay";
	}
	if(findVowels(sWord) == 1)
	{
		return sWord + "way";
	}
	else
	{
		return sWord.substring(findStartConsonant(sWord)+1,sWord.length()) + sWord.substring(0,findStartConsonant(sWord)+1) +"ay";
	}
}
//word.substring(i,i+1).equals("a") || word.substring(i,i+1).equals("e") || word.substring(i,i+1).equals("i") || word.substring(i,i+1).equals("o") || word.substring(i,i+1).equals("u")