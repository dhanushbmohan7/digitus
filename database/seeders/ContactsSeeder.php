<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Seeder;

class ContactsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('persons')->insert([
            [
                'name'            => 'Dhanush',
                'emails'          => json_encode(['dhanush@gmail.com']),
                'contact_numbers' => '9544533972',

            ],
            [
                'name'            => 'Arun',
                'emails'          => json_encode(['arun@gmail.com']),
                'contact_numbers' => '9567843210',

            ],
        ]);
    }
}
