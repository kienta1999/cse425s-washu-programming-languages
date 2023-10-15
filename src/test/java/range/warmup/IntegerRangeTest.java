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

package range.warmup;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@RunWith(Parameterized.class)
public class IntegerRangeTest {
	private final int min;
	private final int maxExclusive;
	private final List<Integer> expectedAsList;

	public IntegerRangeTest(int min, int maxExclusive, List<Integer> expectedAsList) {
		this.min = min;
		this.maxExclusive = maxExclusive;
		this.expectedAsList = expectedAsList;
	}

	private static List<Integer> asList(Iterable<Integer> iterable) {
		List<Integer> result = new LinkedList<>();
		for (Integer i : iterable) {
			result.add(i);
		}
		return result;
	}

	@Test
	public void test() {
		Iterable<Integer> range = Ranges.minToMaxExclusive(min, maxExclusive);
		List<Integer> actualAsList = asList(range);
		assertEquals(expectedAsList, actualAsList);
	}

	@Parameters(name = "min: {0}; maxExclusive: {1}; expectedAsList: {2}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> result = new LinkedList<>();
		result.add(new Object[] { 0, 0, Collections.emptyList() });
		result.add(new Object[] { 1, 0, Collections.emptyList() });
		result.add(new Object[] { 425, 231, Collections.emptyList() });
		result.add(new Object[] { 0, 1, Arrays.asList(0) });
		result.add(new Object[] { 425, 426, Arrays.asList(425) });
		result.add(new Object[] { 0, 3, Arrays.asList(0, 1, 2) });
		result.add(new Object[] { 4, 9, Arrays.asList(4, 5, 6, 7, 8) });
		return result;
	}

}
