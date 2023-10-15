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
package tail.exercise;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

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
public class ReverseComprehensiveTest {
	private final ImList<Integer> original;
	private final ImList<Integer> expected;

	public ReverseComprehensiveTest(List<Integer> original) {
		List<Integer> reversed = new ArrayList<>(original);
		Collections.reverse(reversed);

		this.original = ImListTestUtils.toImmutableList(original);
		this.expected = ImListTestUtils.toImmutableList(reversed);
	}

	@Test
	public void test() {
		ImList<Integer> actual = Reverse.reverse(original);
		assertEquals(expected, actual);
	}

	private static Object[] createRandom(int size) {
		Random random = new Random();
		List<Integer> original = new ArrayList<>(size);
		for (int i = 0; i < size; ++i) {
			int r = random.nextInt(1_000);
			original.add(r);
		}
		return new Object[] { original };
	}

	@Parameters(name = "original: {0}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> result = new LinkedList<>();
		result.add(new Object[] { Arrays.asList() });
		result.add(new Object[] { Arrays.asList(1) });
		result.add(new Object[] { Arrays.asList(2) });
		result.add(new Object[] { Arrays.asList(1, 2) });
		result.add(new Object[] { Arrays.asList(2, 3) });
		result.add(new Object[] { Arrays.asList(1, 2, 3) });
		result.add(new Object[] { Arrays.asList(1, 2, 3, 4) });
		result.add(new Object[] { Arrays.asList(1, 2, 3, 4, 5) });

		for (int i = 0; i < 100; ++i) {
			result.add(createRandom(7));
		}
		return result;
	}

}
