/*******************************************************************************
 * Copyright (C) 2016-2019 Dennis Cosgrove
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 ******************************************************************************/
package hof.find.client.exercise;

import java.util.Optional;

import edu.wustl.cse.cosgroved.NotYetImplementedException;
import hof.find.util.exercise.FindHof;
import immutable.list.util.core.ImList;

/**
 * @author Kien Ta
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class FindHofClients {

	/**
	 * Finds the first word in the specified list which is a palindrome.
	 * 
	 * For example, if the input is ["ambulance", "kayak", "racecar", "train"] then
	 * Optional.of("kayak") should be returned.
	 * 
	 * For example, if the input is ["ambulance", "train"] then Optional.empty()
	 * should be returned.
	 * 
	 * @param words the specified list of words
	 * @return the filtered list of specified words which contain each of the vowels
	 */
	public static Optional<String> findFirstPalindrome(ImList<String> words) {

		return FindHof.find((String s) -> {
            int begin = 0;
            int end = s.length() - 1;
            while(begin < end) {
                if(s.charAt(begin) != s.charAt(end)){
                    return false;
                }
                begin++;
                end--;
            }
            return true;
        }, words);

	}
}
