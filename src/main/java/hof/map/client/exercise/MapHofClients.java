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
package hof.map.client.exercise;

import edu.wustl.cse.cosgroved.NotYetImplementedException;
import hof.map.util.exercise.MapHof;
import immutable.list.util.core.ImList;

/**
 * @author Kien Ta
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class MapHofClients {
	/**
	 * Creates and returns a list whose contents are the lengths of the specified
	 * input texts. The order in the input texts must be preserved in the result.
	 * 
	 * For example, if the input is ["programming", "languages", "Dan"] then the
	 * returned list should be [11, 9, 3].
	 * 
	 * @param texts the specified list of texts
	 * @return the lengths of the specified texts
	 */
	public static ImList<Integer> mapToLengths(ImList<String> texts) {

		return MapHof.map((String s) -> s.length(), texts);

	}

	/**
	 * Creates and returns a list whose contents are the results of whether or not
	 * the specified input items are strictly less than the specified threshold.
	 * 
	 * For example, if the input list is
	 * 
	 * [131, 71, 66, 99, 425, 231, 4, 12]
	 * 
	 * and the threshold is 99 then the returned list should be
	 * 
	 * [false, true, true, false, false, false, true, true].
	 * 
	 * @param xs        the input list of values
	 * @param threshold value used to determine less than
	 * @return a list which holds whether or not each value is less than threshold
	 *         or not
	 */
	public static ImList<Boolean> mapToStrictlyLessThan(ImList<Integer> xs, int threshold) {

		return MapHof.map((Integer i) -> i < threshold, xs);

	}
}
