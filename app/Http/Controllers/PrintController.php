<?php

namespace App\Http\Controllers;

use App\Models\Mark;
use App\Models\Student;
use App\Models\Term;
use Carbon\Carbon;
use Encore\Admin\Facades\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class PrintController extends Controller
{
    public function index()
    {
        if (!isset($_GET['id'])) {
            dd("Term ID NOT SET");
        }
        $term_id = $_GET['id'];
        $term = Term::find($term_id);
        $exam_title = "";
        $user = Admin::user();
        $student = Student::find($user->id);
        // if ($student->my_class == null) {
        //     dd("Class not found");
        // }
        // if ($student->my_class->subjects == null) {
        //     dd("No subject found");
        // }
        // if (count($student->my_class->subjects) < 0) {
        //     dd("No subject found");
        // }

        $results = [];
        $tot = 0;
        foreach ($term->general_exams as $key => $value) {
            $tot += $value->max_marks;
            $marks = Mark::where([
                'general_exam_id' => $value->id,
                'student_id' => $user->id,
            ])->get();
            if ($marks == null) {
                dd("Marks not found");
            }
            if (count($marks) < 1) {
                dd("Marks empty");
            }
            foreach ($marks as $key => $mark) {
                if (!isset($results[$mark->subject_id])) {
                    $results[$mark->subject_id]['subject'] = $mark->subject;
                    $results[$mark->subject_id]['total'] = 0;
                }
                $results[$mark->subject_id]['total'] +=  $mark->mark;
            }
        }
        $rows = "";
        $i = 0;
        foreach ($results as $key => $value) {
            $i++;
            $rows .= "<tr>
                        <th>" . $i . "</th>
                        <th>" . $value['subject']->name . "</th>  
                        <td>" . $value['total'] . "</td>  
            </tr>";
            # code...
        }

        $data = "
            <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            }
            table{
                  width: 100%;
              }
              </style>
        ";
        $data .= '<h2 style="text-align: center;  margin: 0; padding: 0; font-weight: 100;">' . $term->name . '</h2>';
        $data .= '<h2 style="text-align: center; margin: 0; padding: 0; font-weight: 100;"> Examination Report</h2>';
        $data .= '<h2 style="text-align: center;  margin: 0; padding: 0; font-weight: 100;">' . Carbon::now()->toFormattedDateString() . '</h2>';
        $data .= "<hr>";
        $data .= '<h2 style=" margin: 0,10px,0,10px; padding: 0; font-weight: 100;">
                    STUDENT NAME: <b style="border-bottom: 1px dashed black;">' . $term->name . '</b></h2>';

        $data .= '<table>
                    <thead>
                        <tr>
                            <th style="width: 10;">#</th>
                            <th>SUBJECTS</th>
                            <th>TOTAL MARKS(' . $tot . ')</th>
                        </tr>
                    </thead>
                    <tbody>' . $rows . '</tbody>
        </table>';


        $pdf = App::make('dompdf.wrapper');
        $pdf->loadHTML($data);
        return $pdf->stream();
    }
    // 
}
