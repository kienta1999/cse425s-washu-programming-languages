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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import immutable.list.core.ImListTestUtils;
import immutable.list.util.core.ImList;

@RunWith(Parameterized.class)
/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class ConcatTest {
    private final ImList<Integer> a;
    private final ImList<Integer> b;
    private final ImList<Integer> expected;
    public ConcatTest(List<Integer> a, List<Integer> b) {
    	List<Integer> expected = new ArrayList<Integer>(a.size() + b.size());
    	expected.addAll(a);
    	expected.addAll(b);
        this.a = ImListTestUtils.toImmutableList(a);
        this.b = ImListTestUtils.toImmutableList(b);
        this.expected = ImListTestUtils.toImmutableList(expected);
    }

    @Test
    public void test() {
    	ImList<Integer> actual = Concat.concat(a, b);
    	String message = "expected(complete): " + expected.toString() + "; actual(complete): " + actual.toString(); 
    	
    	ImList<Integer> expectedPrime = expected;
    	ImList<Integer> actualPrime = actual;
    	
    	while(!expectedPrime.isEmpty()) {
    		assertFalse(message, actualPrime.isEmpty());
    		assertEquals(message, expectedPrime.head(), actualPrime.head());
    		expectedPrime = expectedPrime.tail();
    		actualPrime = actualPrime.tail();
    	}
    	assertTrue(message, actualPrime.isEmpty());
    }

    @Parameterized.Parameters(name = "a: {0}; b: {1}")
    public static Collection<Object[]> getConstructorArguments() {
        return Arrays.asList(
                new Object[]{Collections.emptyList(), Collections.emptyList()},
                new Object[]{Arrays.asList(425), Collections.emptyList()},
                new Object[]{Collections.emptyList(), Arrays.asList(425)},
                new Object[]{Arrays.asList(4, 66, 99), Collections.emptyList()},
                new Object[]{Collections.emptyList(), Arrays.asList(4, 66, 99)},
                new Object[]{Arrays.asList(425), Arrays.asList(231)},
                new Object[]{Arrays.asList(425,231), Arrays.asList(4,66,99)}
        );
    }
}
