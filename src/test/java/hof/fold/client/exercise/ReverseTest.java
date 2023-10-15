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
package hof.fold.client.exercise;

import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.nil;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.function.BiFunction;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TestRule;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import com.google.common.collect.Lists;

import edu.wustl.cse.cosgroved.junit.JUnitUtils;
import hof.fold.util.exercise.FoldHof;
import immutable.list.core.ImListTestUtils;
import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
@RunWith(Parameterized.class)
public class ReverseTest {
	private final List<Object> input;

	public ReverseTest(List<Object> input) {
		this.input = input;
	}

	@Rule
	public TestRule timeout = JUnitUtils.createTimeoutRule();

	@Test
	public void test() {
		List<Object> reversedInput = Lists.reverse(input);

		ImList<Object> forwardImmutableList = ImListTestUtils.toImmutableList(input);
		check(input, forwardImmutableList);

		BiFunction<ImList<Object>, Object, ImList<Object>> consFunction = (a, b) -> {
			return cons(b, a);
		};

		ImList<Object> reverseImmutableList = FoldHof.foldLeft(consFunction, nil(), forwardImmutableList);
		check(reversedInput, reverseImmutableList);

		ImList<Object> reverseReverseImmutableList = FoldHof.foldLeft(consFunction, nil(), reverseImmutableList);
		check(input, reverseReverseImmutableList);
	}

	private void check(List<Object> expected, ImList<Object> actual) {
		for (Object o : expected) {
			assertFalse(actual.isEmpty());
			assertEquals(o, actual.head());
			actual = actual.tail();
			assertNotNull(actual);
		}
		assertTrue(actual.isEmpty());
	}

	@Parameters(name = "{0}")
	public static Collection<Object[]> getConstructorArguments() {
		List<Object[]> result = new LinkedList<>();
		result.add(new Object[] { Arrays.asList() });
		result.add(new Object[] { Arrays.asList(1) });
		result.add(new Object[] { Arrays.asList(231, 425) });
		result.add(new Object[] { Arrays.asList(4, 66, 99) });

		result.add(new Object[] { Arrays.asList("a", "b", "c") });
		result.add(new Object[] { Arrays.asList(4, 20, 7) });
		result.add(new Object[] { Arrays.asList("four", "score", "and", "seven", "years", "ago") });

		Random random = new Random();
		for (int i = 0; i < 100; ++i) {
			int capacity = 3 + random.nextInt(4);
			List<Integer> list = new ArrayList<Integer>(capacity);
			for (int j = 0; j < capacity; ++j) {
				int r = random.nextInt(1_000);
				list.add(r);
			}
			result.add(new Object[] { list });
		}
		return result;
	}

}
