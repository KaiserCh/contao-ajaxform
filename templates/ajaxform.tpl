
<!-- indexer::stop -->
<div class="<?php echo $this->class; ?> <?php echo $this->tableless ? 'tableless' : 'tableform'; ?> block"<?php echo $this->cssID; ?><?php if ($this->style): ?> style="<?php echo $this->style; ?>"<?php endif; ?>>
<?php if ($this->headline): ?>

<<?php echo $this->hl; ?>><?php echo $this->headline; ?></<?php echo $this->hl; ?>>
<?php endif; ?>

<form action="<?php echo $this->action; ?>" id="<?php echo $this->formId; ?>" method="<?php echo $this->method; ?>" enctype="<?php echo $this->enctype; ?>"<?php echo $this->attributes; ?>>
<div class="formbody">
<?php if ($this->method != 'get'): ?>
<input type="hidden" name="FORM_SUBMIT" value="<?php echo $this->formSubmit; ?>" />
<input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $this->maxFileSize; ?>" />
<?php endif; ?>
<?php echo $this->hidden; ?>
<?php if (!$this->tableless): ?>
<table cellspacing="0" cellpadding="0" summary="Form fields">
<?php echo $this->fields; ?>
</table>
<?php else: echo $this->fields; endif; ?>
</div>
</form>

</div>

<script type="text/javascript">
<!--//--><![CDATA[//><!--
<?php if ($this->hasError): ?>
window.scrollTo(null, ($('<?php echo $this->formId; ?>').getElement('p.error').getPosition().y - 20));
<?php endif; ?>
window.addEvent('domready', function() {
	$('<?php echo $this->formId; ?>').addEvent('submit', function(event) {
		event.target.set('send', {
			onComplete: function(txt, xml) {
				if (txt == 'true')
				{
					event.target.removeEvent('submit');
					event.target.submit();
					return;
				}
				
				new Fx.Tween(event.target, {property: 'opacity', duration: 200}).start(1,0).chain(
				    function(){ this.element.set('html', txt); this.start(0,1); }
				);
			}
		});
		event.target.send('<?php echo $this->ajaxAction; ?>');
		return false;
	});
});
//--><!]]>
</script>

<!-- indexer::continue -->
