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
package hof.fold.client.exercise;

import static immutable.list.util.exercise.ImLists.brackets;
import static immutable.list.util.exercise.ImLists.nil;
import static org.junit.Assert.assertEquals;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import edu.wustl.cse.cosgroved.junit.JUnitUtils;
import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@RunWith(Parameterized.class)
public class FoldBetweenTest {
	private final int min;
	private final int maxExclusive;
	private final ImList<Integer> original;
	private final int expected;

	public FoldBetweenTest(int min, int maxExclusive, ImList<Integer> original, int expected) {
		this.min = min;
		this.maxExclusive = maxExclusive;
		this.original = original;
		this.expected = expected;
	}

	@Rule
	public TestRule timeout = JUnitUtils.createTimeoutRule();

	@Test
	public void test() {
		int actual = FoldHofClients.countBetweenMinAndMaxExclusive(min, maxExclusive, original);
		assertEquals(expected, actual);
	}

	@Parameters(name = "original: {0}; min: {1}; maxExclusive: {2}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> result = new LinkedList<>();
		result.add(new Object[] { 231, 425, nil(), 0 });
		result.add(new Object[] { 100, 200, brackets(231, 425), 0 });
		result.add(new Object[] { 100, 300, brackets(231, 425), 1 });
		result.add(new Object[] { 100, 500, brackets(231, 425), 2 });
		result.add(new Object[] { 2, 4, brackets(1, 2, 3, 4), 2 });
		return result;
	}
}
