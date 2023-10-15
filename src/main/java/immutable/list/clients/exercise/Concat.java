/*******************************************************************************
 * Copyright (C) 2016-2020 Dennis Cosgrove
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
package immutable.list.clients.exercise;

import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.brackets;

import edu.wustl.cse.cosgroved.NotYetImplementedException;
import immutable.list.util.core.ImList;

/**
 * @author Kien Ta
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class Concat {
	/**
	 * Produces a ImmutableList which is equivalent to ys concatenated onto xs.
	 * 
	 * For example, if xs is ["four", "score", "and"] and ys is ["seven", "years",
	 * "ago"] this method should return the ImmutableList ["four", "score", "and",
	 * "seven", "years", "ago"].
	 * 
	 * @param <E> the class of Objects in the ImmutableLists
	 * @param xs  the first list
	 * @param ys  the second list
	 * @return the list that is the contents of xs followed by the contents of ys
	 */
	public static <E> ImList<E> concat(ImList<E> xs, ImList<E> ys) {
		if(xs.isEmpty()) {
			return ys;
		}
		else {
			return cons(xs.head(), concat(xs.tail(), ys));
		}
	}
}
