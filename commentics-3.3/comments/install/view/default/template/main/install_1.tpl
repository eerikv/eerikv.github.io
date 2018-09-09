<?php echo $header; ?>

<div class="install_1_page">

	<?php if ($installed) { ?>

	<div class="error"><?php echo $lang_error_installed; ?></div>

	<?php } else { ?>

	<p><?php echo $lang_text_install; ?></p>

	<form action="index.php?route=install_2" class="form" method="post">

		<div class="left">
			<span class="heading"><?php echo $lang_heading_admin; ?></span>

			<p><span class="heading_note"><?php echo $lang_text_admin; ?></span></p>

			<div>
				<span class="field_heading"><?php echo $lang_entry_admin_username; ?></span> <span class="required_symbol">*</span><br>
				<input type="text" required autofocus name="username" class="username"> <span class="note"><?php echo $lang_note_admin_username; ?></span>
			</div>

			<div>
				<span class="field_heading"><?php echo $lang_entry_admin_password; ?></span> <span class="required_symbol">*</span><br>
				<input type="password" required name="password_1" class="password_1"> <span class="note"><?php echo $lang_note_admin_password; ?></span>
			</div>

			<div>
				<span class="field_heading"><?php echo $lang_entry_repeat_password; ?></span> <span class="required_symbol">*</span><br>
				<input type="password" required name="password_2" class="password_2"> <span class="note"><?php echo $lang_note_repeat_password; ?></span>
			</div>

			<div>
				<span class="field_heading"><?php echo $lang_entry_strength; ?></span><br>
				<span id="password_strength" class="strength_0"></span>
				<span id="password_description"></span>
			</div>

			<div>
				<span class="field_heading"><?php echo $lang_entry_email_address; ?></span> <span class="required_symbol">*</span><br>
				<input type="email" required name="email" class="email"> <span class="note"><?php echo $lang_note_email_address; ?></span>
			</div>
		</div>

		<div class="center">
			<span class="heading"><?php echo $lang_heading_website; ?></span>

			<p><span class="heading_note"><?php echo $lang_text_website; ?></span></p>

			<div>
				<span class="field_heading"><?php echo $lang_entry_site_name; ?></span> <span class="required_symbol">*</span><br>
				<input type="text" required name="site_name" class="site_name" value="My Site"> <span class="note"><?php echo $lang_note_site_name; ?></span>
			</div>

			<div>
				<span class="field_heading"><?php echo $lang_entry_ssl_certificate; ?></span> <span class="required_symbol">*</span><br>
				<select name="ssl_certificate" class="ssl_certificate">
					<option value="1"><?php echo $lang_text_yes; ?></option>
					<option value="0" selected><?php echo $lang_text_no; ?></option>
				</select>
				<span class="note"><?php echo $lang_note_ssl_certificate; ?></span>
			</div>
		</div>

		<div class="right">
			<span class="heading"><?php echo $lang_heading_general; ?></span>

			<p><span class="heading_note"><?php echo $lang_text_general; ?></span></p>

			<div>
				<span class="field_heading"><?php echo $lang_entry_time_zone; ?></span> <span class="required_symbol">*</span><br>
				<select name="time_zone" class="time_zone">
				<?php foreach ($time_zones as $time_zone) { ?>
					<option value="<?php echo $time_zone; ?>"><?php echo $time_zone; ?></option>
				<?php } ?>
				</select>
				<span class="note"><?php echo $lang_note_time_zone; ?></span>
			</div>

			<input type="submit" class="button" value="<?php echo $lang_button_install; ?>" title="<?php echo $lang_button_install; ?>">
		</div>

	</form>

	<script>
	// <![CDATA[
	$(document).ready(function() {
		$('.form').submit(function(e) {
			$('.field_error').remove();

			if ($('.password_1').val().length < 5) {
				$('.password_1').next().after('<div class="field_error"><?php echo $lang_error_password_length; ?></div>');
			} else if ($('.password_1').val() != $('.password_2').val()) {
				$('.password_1').next().after('<div class="field_error"><?php echo $lang_error_password_mismatch; ?></div>');
				$('.password_2').next().after('<div class="field_error"><?php echo $lang_error_password_mismatch; ?></div>');
			}

			if ($('.site_name').val() == 'My Site') {
				$('.site_name').next().after('<div class="field_error"><?php echo $lang_error_site_name; ?></div>');
			}

			if ($('.field_error').length) {
				e.preventDefault();
			} else {
				$('.form').submit();
			}
		});
	});
	// ]]>
	</script>

	<?php } ?>

</div>

<?php echo $footer; ?>