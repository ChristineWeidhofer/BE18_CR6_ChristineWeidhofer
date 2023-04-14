<?php

namespace App\Form;

use App\Entity\Address;
use App\Entity\Event;
use App\Entity\Type;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:1rem']
            ])
            ->add('date', DateTimeType::class, [
                'attr' => ['class' => 'form-control input-group pink', 'style' => 'margin-bottom:1rem']
            ])
            ->add('descr', TextareaType::class, [
                'attr' => ['class' => 'form-control tinymce', 'style' => 'margin-bottom:1rem'],
                'label' => 'Description',
            ])
            ->add('image', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:1rem']
            ])
            ->add('fk_type', EntityType::class, [
                'attr' => ['class' => 'form-select', 'style' => 'margin-bottom:1rem'],
                'class' => Type::class,
                'choice_label' => 'type',
                'label' => 'Type',
            ])         
            ->add('cap', null, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:1rem'],
                'label' => 'Capacity',
            ])
            ->add('location', ChoiceType::class, [
                'choices' => ['Wiener Staatsoper' => 'Wiener Staatsoper', 'Volkstheater' => 'Volkstheater', 'Museumsquartier' => 'Museumsquartier', 'Volksgarten' => 'Volksgarten'],
                'attr' => ['class' => 'form-select', 'style' => 'margin-bottom:1rem'],
            ])

            ->add('fk_address', EntityType::class, [
                'attr' => ['class' => 'form-select', 'style' => 'margin-bottom:1rem'],
                'class' => Address::class,
                'choice_label' => 'street',
                'label' => 'Chose an address',
            ])    
            ->add('email', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:1rem']
            ])
            ->add('phone', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:1rem']
            ])
            ->add('url', TextType::class, [
                'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:1rem'],
                'label' => 'URL',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
