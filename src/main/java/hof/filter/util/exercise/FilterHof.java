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
package hof.filter.util.exercise;

import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.nil;

import java.util.function.Predicate;

import edu.wustl.cse.cosgroved.NotYetImplementedException;
import immutable.list.util.core.ImList;

/**
 * @author Kien Ta
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class FilterHof {

	/**
	 * Creates and returns a list whose contents are the filtered result of the
	 * specified input's elements which pass the predicate's test. The order in the
	 * input must be preserved in the result.
	 * 
	 * @see <a href="http://sml-family.org/Basis/list.html#SIG:LIST.filter:VAL">SML
	 *      filter</a>
	 * 
	 * @param <E>       input and result list item type
	 * @param predicate predicate to test each item in the specified list as to
	 *                  whether it should be included or not in the result.
	 * @param list      the specified list of items.
	 * @return a list consisting of the elements which pass the predicate's test
	 */
	public static <E> ImList<E> filter(Predicate<E> predicate, ImList<E> list) {

		if(list.isEmpty()) {
            return nil();
        }
        E head = list.head();
        if(predicate.test(head)){
            return cons(head, filter(predicate, list.tail()));
        } else {
            return filter(predicate, list.tail());
        }

	}
}
