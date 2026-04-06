---
layout: default
---

# Show Your Support

Want to show your support for ethics in science? Add a badge to your website or email signature. Each badge links back to [labhole.fyi](https://labhole.fyi) so others can learn more.

Pick a phrase below — or write your own — then copy the HTML.

## Build Your Badge

<div class="badge-builder" id="badge-builder">

  <label for="badge-phrase">Choose a phrase</label>
  <select id="badge-phrase">
    <option value="Don't be a labhole.">Don't be a labhole.</option>
    <option value="labhole.fyi">labhole.fyi</option>
    <option value="I support ethical science.">I support ethical science.</option>
    <option value="Be the lab you wish you had.">Be the lab you wish you had.</option>
    <option value="Science with integrity.">Science with integrity.</option>
    <option value="Respect drives discovery.">Respect drives discovery.</option>
    <option value="__custom__">Custom...</option>
  </select>

  <div class="badge-builder__custom-input badge-builder__custom-input--hidden" id="custom-input-wrap">
    <label for="badge-custom-text">Your custom text</label>
    <input type="text" id="badge-custom-text" placeholder="Type your badge text…" maxlength="80">
  </div>

  <div class="badge-builder__preview">
    <p class="badge-builder__preview-label">Preview:</p>
    <div class="badge-builder__preview-area" id="badge-preview" aria-live="polite"></div>
  </div>

  <div class="badge-builder__actions">
    <button type="button" class="badge-builder__copy-btn" id="copy-html-btn" role="status">Copy HTML</button>
  </div>

</div>

*These badges use inline styles so they work on any website. For email signatures, results may vary depending on your email client.*

<script>
(function () {
  "use strict";

  var phraseSelect  = document.getElementById("badge-phrase");
  var customWrap    = document.getElementById("custom-input-wrap");
  var customInput   = document.getElementById("badge-custom-text");
  var previewArea   = document.getElementById("badge-preview");
  var copyBtn       = document.getElementById("copy-html-btn");

  /** Build the badge HTML string for a given text value. */
  function badgeHTML(text) {
    // Escape HTML entities in user-provided text
    var escaped = text
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
    // Single quotes are not escaped because the generated HTML
    // uses double-quoted attributes exclusively.
    return '<a href="https://labhole.fyi" target="_blank" rel="noopener" style="display:inline-block;padding:6px 14px;background:#211103;color:#E8E0DA;font-family:Montserrat,Helvetica,Arial,sans-serif;font-size:14px;font-weight:600;text-decoration:none;border:1px solid #557E73;border-radius:4px;">' + escaped + "</a>";
  }

  /** Return the current badge text based on UI state. */
  function currentText() {
    if (phraseSelect.value === "__custom__") {
      return customInput.value.trim() || "Your text here";
    }
    return phraseSelect.value;
  }

  /** Refresh the live preview. */
  function updatePreview() {
    previewArea.innerHTML = badgeHTML(currentText());
  }

  /** Toggle visibility of the custom text input. */
  function toggleCustom() {
    var isCustom = phraseSelect.value === "__custom__";
    if (isCustom) {
      customWrap.classList.remove("badge-builder__custom-input--hidden");
      customInput.focus();
    } else {
      customWrap.classList.add("badge-builder__custom-input--hidden");
    }
    updatePreview();
  }

  /** Copy badge HTML to clipboard. */
  function copyHTML() {
    var html = badgeHTML(currentText());

    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(html).then(showCopied, fallbackCopy);
    } else {
      fallbackCopy();
    }

    function fallbackCopy() {
      var ta = document.createElement("textarea");
      ta.value = html;
      ta.style.position = "fixed";
      ta.style.opacity = "0";
      document.body.appendChild(ta);
      ta.select();
      try { document.execCommand("copy"); showCopied(); }
      catch (e) { alert("Copy failed. Please select the HTML manually and copy it."); }
      document.body.removeChild(ta);
    }
  }

  var copyTimeout = null;

  /** Flash the button text to "Copied!" for 2 seconds. */
  function showCopied() {
    if (copyTimeout) { clearTimeout(copyTimeout); }
    copyBtn.textContent = "Copied!";
    copyBtn.classList.add("badge-builder__copy-btn--copied");
    copyTimeout = setTimeout(function () {
      copyBtn.textContent = "Copy HTML";
      copyBtn.classList.remove("badge-builder__copy-btn--copied");
      copyTimeout = null;
    }, 2000);
  }

  // Wire up events
  phraseSelect.addEventListener("change", toggleCustom);
  customInput.addEventListener("input", updatePreview);
  copyBtn.addEventListener("click", copyHTML);

  // Initial render
  updatePreview();
})();
</script>
