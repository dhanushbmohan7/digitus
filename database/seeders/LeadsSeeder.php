<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Seeder;

class LeadsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        DB::table('leads')->insert([
            [
                'title'        => 'Need Sofa',
                'description'  => 'Client interested Sofa',
                'lead_value'   => 35000,
                'person_id'    => 1,
                'lead_type_id' => 1,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],
            [
                'title'        => 'Plastic chair need',
                'description'  => 'Wants plastic chair',
                'lead_value'   => 12000,
                'person_id'    => 2,
                'lead_type_id' => 2,
                'created_at'   => now(),
                'updated_at'   => now(),
            ],
        ]);

    }
}
