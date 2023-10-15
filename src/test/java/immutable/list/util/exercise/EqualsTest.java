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

import static immutable.list.util.exercise.ImLists.cons;
import static immutable.list.util.exercise.ImLists.nil;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Transferable;
import java.io.IOException;
import java.util.NoSuchElementException;

import org.junit.Test;

import immutable.list.util.core.ImList;

/**
 * @author Dennis Cosgrove (http://www.cse.wustl.edu/~cosgroved/)
 */
public class EqualsTest {
	@Test
	public void test() throws IOException {
		ImList<Integer> empty = nil();
		ImList<Integer> nonempty = cons(71, nil());
		assertNotNull(empty);
		assertTrue(empty.isEmpty());
		assertEquals(empty, empty);
		assertNotEquals(empty, nonempty);
		try {
			assertNotEquals(nonempty, empty);
		} catch (NoSuchElementException nsee) {
			String code = String.join(System.getProperty("line.separator"), "	@Override",
					"	public boolean equals(Object o) {", "		if (this == o) {", "			return true;",
					"		}", "		if (o == null) {", "			return false;", "		}",
					"		if (o instanceof ImmutableList) {",
					"			ImmutableList<?> that = (ImmutableList<?>) o;", "			if (that.isEmpty()) {",
					"				return false;", "			} else {",
					"				return Objects.equals(head(), that.head()) && Objects.equals(tail(), that.tail());",
					"			}", "		} else {", "			return false;", "		}", "	}");

			String url = "https://classes.engineering.wustl.edu/cse425s/index.php?title=ImmutableList_Assignment#Replace_NonEmptyImmutableList_equals.28.29";
			String detail = String.format(
					"\n===============\nReplace the equals implementation in NonEmptyImmutableList with the code below (note: copied to the clipboard for you to paste):\n\n%s\n\nCheck out:\n    %s\nfor details.\n===============",
					code, url);

			Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
			Transferable transferable = new StringSelection(code);
			clipboard.setContents(transferable, null);

			System.out.println(detail);

			if (isLinux()) {
				System.out.print(
				"\n\nNOTE: Using the clipboard from Java on Linux has issues when the program exits, so you will need to swipe and copy the code above.");
//				System.out.print(
//						"\n\nUsing the clipboard from Java on Linux has issues if the program exits.\nThis test pauses by reading from standard input to allow you to paste the code over equals() in NonEmptyImmutableList.java.\nAfter you have pasted the code, press any key in the console window to continue (which will appropriately throw an Exception): ");
//				System.in.read();
			}

			throw new RuntimeException(detail);
		}
	}

	private static final boolean isLinux() {
		return System.getProperty("os.name").toLowerCase().startsWith("linux");
	}
}
