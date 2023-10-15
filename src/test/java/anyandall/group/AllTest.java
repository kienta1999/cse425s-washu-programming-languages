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
package anyandall.group;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.junit.runners.Parameterized;

import immutable.list.core.ImListTestUtils;
import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@RunWith(Parameterized.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class AllTest {
	private final boolean expected;
	private final ImList<Boolean> list;
	private final boolean[] array;

	public AllTest(boolean expected, List<Boolean> values) {
		this.expected = expected;
		this.list = ImListTestUtils.toImmutableList(values);
		this.array = new boolean[values.size()];
		int i = 0;
		for (boolean value : values) {
			this.array[i] = value;
			i++;
		}
	}

	@Test
	public void testArray() {
		boolean actual = All.all(array);
		if (expected) {
			assertTrue(actual);
		} else {
			assertFalse(actual);
		}
	}

	@Test
	public void testList() {
		boolean actual = All.all(list);
		if (expected) {
			assertTrue(actual);
		} else {
			assertFalse(actual);
		}
	}

	@Test
	public void testPredicate() {
		boolean actual = All.all((b) -> b, list);
		if (expected) {
			assertTrue(actual);
		} else {
			assertFalse(actual);
		}
	}

	@Parameterized.Parameters(name = "expected: {0}; values: {1}")
	public static Collection<Object[]> getConstructorArguments() {
		return Arrays.asList(new Object[] { true, Collections.emptyList() },
				new Object[] { false, Arrays.asList(false) }, new Object[] { true, Arrays.asList(true) },
				new Object[] { false, Arrays.asList(false, false) },
				new Object[] { false, Arrays.asList(false, false, false) },
				new Object[] { false, Arrays.asList(true, false, false) },
				new Object[] { false, Arrays.asList(false, true, false) },
				new Object[] { false, Arrays.asList(false, false, true) },
				new Object[] { true, Arrays.asList(true, true) },
				new Object[] { false, Arrays.asList(true, true, false) },
				new Object[] { true, Arrays.asList(true, true, true) });
	}
}
