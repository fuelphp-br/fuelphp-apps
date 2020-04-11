<?php echo Form::open(); ?>
	<fieldset>
		<div class="form-group">
			<?php echo Form::label('Nome', 'nome', array('class' => 'control-label')); ?>

			<?php echo Form::input('nome', Input::post('nome', isset($vendedor) ? $vendedor->nome : ''), array('class' => 'form-control', 'placeholder' => 'Nome')); ?>
		</div>

		<div class="form-group">
			<?php echo Form::label('Email', 'email', array('class' => 'control-label')); ?>

			<?php echo Form::input('email', Input::post('email', isset($vendedor) ? $vendedor->email : ''), array('class' => 'form-control', 'placeholder' => 'Email')); ?>
		</div>

		<div class="form-group">
			<?php echo Form::label('Cpf', 'cpf', array('class' => 'control-label')); ?>

			<?php echo Form::input('cpf', Input::post('cpf', isset($vendedor) ? $vendedor->cpf : ''), array('class' => 'form-control', 'placeholder' => 'Cpf')); ?>
		</div>

		<div class="form-group">
			<?php echo Form::submit('submit', 'Save', array('class' => 'btn btn-primary')); ?>

			<div class="pull-right">
				<?php if (Uri::segment(3) === 'edit'): ?>
					<div class="btn-group">
						<?php echo Html::anchor('admin/vendedor/view/'.$vendedor->id, 'View', array('class' => 'btn btn-info')); ?>
						<?php echo Html::anchor('admin/vendedor', 'Back', array('class' => 'btn btn-default')); ?>
					</div>
				<?php else: ?>
					<?php echo Html::anchor('admin/vendedor', 'Back', array('class' => 'btn btn-link')); ?>
				<?php endif ?>
			</div>
		</div>
	</fieldset>


<?php echo Form::close(); ?>