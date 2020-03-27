# Code snippet
````
/**
 * Get specified file
 * Access:
 *   direct access: platform level
 *   conditional access: organizational users - to files of their organization,
 *   user - to own customer files
 *
 * @param $id File ID
 *
 * @queryParam id required File ID
 *
 * @response 200 {
 *  "success": true,
 *  "code": 200,
 *  "message": "Result is successful.",
 *  "data": {
 *    "id": 1,
 *    "owner_object_type": "customer",
 *    "owner_object_id": 1,
 *    "description": "Description text",
 *    "filename": "customer_1_test-file-1368415461.jpg",
 *    "owner_user_id": 16,
 *    "deleted_at": null,
 *    "created_at": "2019-06-24 07:12:03",
 *    "updated_at": "2019-06-24 07:12:03"
 *  }
 * }
 *
 * @response 453 {
 *   "success": false,
 *   "code": 453,
 *   "message":  "Permission is absent by the role.",
 *   "data": null
 * }
 *
 * @response 454 {
 *   "success": false,
 *   "code": 454,
 *   "message":  "Middleware.Files. Permission is absent by the role.",
 *   "data": null
 * }
 *
 * @response 456 {
 *   "success": false,
 *   "code": 456,
 *   "message":  "Middleware.Files. Incorrect ID in URL.",
 *   "data": null
 * }
 *
 * @return \Illuminate\Http\JsonResponse
 */
public function getFile($id)
{
    $file = File::whereId($id)
        ->first();

    if (!$file) {
        return response()->json($this->resp(456, 'Files.getFile'), 456);
    }

    $exist = Storage::disk('public')->exists($file->filename);
    if (!$exist) {
        return response()->json($this->resp(456, 'Files.getFile'), 456);
    }

    $size = Storage::disk('public')->size($file->filename);
    $headers = [
        header('Content-Description: File Transfer'),
        header('Content-Type: application/octet-stream'),
        header('Content-Disposition: attachment; filename=' . $file->filename),
        header('Expires: 0'),
        header('Cache-Control: must-revalidate'),
        header('Pragma: public'),
        header('Content-Length: ' . $size)
    ];

    return Storage::disk('public')->download($file->filename, $file->filename, $headers);
}
````

