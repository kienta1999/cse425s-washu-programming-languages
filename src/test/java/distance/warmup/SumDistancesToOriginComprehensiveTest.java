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
package distance.warmup;

import static org.junit.Assert.assertEquals;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import immutable.list.util.core.ImList;
import immutable.list.util.exercise.ImLists;
import immutable.tuple.ImTuple2;
import immutable.tuple.ImTuples;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@RunWith(Parameterized.class)
public class SumDistancesToOriginComprehensiveTest {
	private final double expected;
	private final ImList<ImTuple2<Double, Double>> xys;

	public SumDistancesToOriginComprehensiveTest(double expected, ImList<ImTuple2<Double, Double>> xys) {
		this.expected = expected;
		this.xys = xys;
	}

	@Test
	public void test() {
		double actual = SumDistancesToOrigin.sumDistancesToOrigin(xys);
		assertEquals(expected, actual, 0.0);
	}

	@Parameters(name = "expected: {0}; xys: {1}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> result = new LinkedList<>();
		result.add(new Object[] { 0.0, ImLists.brackets() });
		result.add(new Object[] { 0.0, ImLists.brackets(ImTuples.parens(0.0, 0.0)) });
		result.add(new Object[] { 1.0, ImLists.brackets(ImTuples.parens(0.0, 1.0)) });
		result.add(new Object[] { 1.0, ImLists.brackets(ImTuples.parens(1.0, 0.0)) });

		result.add(new Object[] { 0.0, ImLists.brackets(ImTuples.parens(0.0, 0.0)) });
		result.add(new Object[] { 1.0, ImLists.brackets(ImTuples.parens(1.0, 0.0)) });
		result.add(new Object[] { 1.0, ImLists.brackets(ImTuples.parens(0.0, 1.0)) });
		result.add(new Object[] { 5.0, ImLists.brackets(ImTuples.parens(3.0, 4.0)) });
		result.add(new Object[] { 10.0, ImLists.brackets(ImTuples.parens(6.0, 8.0)) });
		result.add(new Object[] { 0.0, ImLists.brackets(ImTuples.parens(0.0, 0.0), ImTuples.parens(0.0, 0.0)) });
		result.add(new Object[] { 1.0, ImLists.brackets(ImTuples.parens(0.0, 0.0), ImTuples.parens(1.0, 0.0)) });
		result.add(new Object[] { 2.0, ImLists.brackets(ImTuples.parens(1.0, 0.0), ImTuples.parens(1.0, 0.0)) });
		result.add(new Object[] { 2.0, ImLists.brackets(ImTuples.parens(1.0, 0.0), ImTuples.parens(0.0, 1.0)) });
		result.add(new Object[] { 17.0, ImLists.brackets(ImTuples.parens(1.0, 0.0), ImTuples.parens(0.0, 1.0),
				ImTuples.parens(3.0, 4.0), ImTuples.parens(6.0, 8.0)) });

		return result;
	}
}
