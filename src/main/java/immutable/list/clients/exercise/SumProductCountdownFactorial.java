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
import static immutable.list.util.exercise.ImLists.nil;

import edu.wustl.cse.cosgroved.NotYetImplementedException;
import immutable.list.util.core.ImList;

/**
 * @author Kien Ta
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class SumProductCountdownFactorial {
	/**
	 * For example, if xs is [1776, 80, 7] then 1863 should be returned.
	 * 
	 * @param xs the list
	 * @return the sum of the list
	 */
	public static int sum(ImList<Integer> xs) {

		if (xs.isEmpty()) {
            return 0;
        } else {
            return xs.head() + sum(xs.tail());
        }

	}

	/**
	 * For example, if xs is [12, 3, 1760] then 63360 should be returned.
	 * 
	 * @param xs the list
	 * @return the result of multiplying the values in xs
	 */
	public static int product(ImList<Integer> xs) {

		if (xs.isEmpty()) {
            return 1;
        } else {
            return xs.head() * product(xs.tail());
        }

	}

	/**
	 * For example, if n is 5 then the result should be the list [5,4,3,2,1].
	 * 
	 * @param n the value to countdown from
	 * @return the list which contains the numbers from n down to 1
	 */
	public static ImList<Integer> countdown(int n) {

		if (n == 0) {
            return nil();
        } else {
            return cons(n, countdown(n-1));
        }

	}

	/**
	 * @see <a href="https://en.wikipedia.org/wiki/Factorial">Factorial on
	 *      Wikipedia</a>
	 * 
	 * @param n the value
	 * @return n!
	 */
	public static int factorial(int n) {

		return product(countdown(n));

	}
}
