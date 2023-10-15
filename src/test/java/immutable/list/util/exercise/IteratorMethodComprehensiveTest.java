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
package immutable.list.util.exercise;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import immutable.list.core.ImListTestUtils;
import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */

@RunWith(Parameterized.class)
public class IteratorMethodComprehensiveTest {
	private final List<Object> expected;
	private final ImList<Object> actual;

	public IteratorMethodComprehensiveTest(List<Object> list) {
		this.expected = list;
		this.actual = ImListTestUtils.toImmutableList(expected);
	}

	@Test
	public void test() {
		Iterator<Object> expectedIterator = expected.iterator();
		Iterator<Object> actualIterator = actual.iterator();

		assertNotNull(actualIterator);
		while (expectedIterator.hasNext()) {
			assertTrue(actualIterator.hasNext());
			Object expectedValue = expectedIterator.next();
			Object actualValue = actualIterator.next();
			assertSame(expectedValue, actualValue);
		}
		assertFalse(actualIterator.hasNext());
	}

	@Parameters(name = "{0}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> result = new LinkedList<>();
		result.add(new Object[] { Arrays.asList(4, 66, 99) });
		result.add(new Object[] { Arrays.asList("truth", "is", "beauty") });
		result.add(new Object[] { Arrays.asList(131, 231, 425, 437) });
		result.add(new Object[] { Arrays.asList("four", "score", "and", "seven", "years", "ago") });
		return result;
	}
}
