class PromptResponseEntity{
  final String status;
  final String originalPrompt;
  final String optimizedPrompt;
  final String explanation;

  PromptResponseEntity({
    required this.status,
    required this.originalPrompt,
    required this.optimizedPrompt,
    required this.explanation
  }); 

}

// {
//    "status":"success",
//    "original_prompt":"Eres un Experto en Marketing Digital y Ventas en Amazon KDP.\nTarea: Diseñar una estrategia de lanzamiento para mis libros de colorear\nContexto: Libro para extranjeros sobre cultura mexicana (comida y Xochimilco) que incluye frases locales, traducción y pronunciación. Disponible en Amazon kdp.\nRestricciones: Enfocado en turistas que visitan México, No usar lenguaje demasiado técnico, Sugerir 3 etiquetas (keywords) para Amazon kdp, Máximo 300 palabras\n\nSi es necesario, formula preguntas antes de responder.",
//    "optimized_prompt":"Eres un Experto en Marketing Digital y Ventas en Amazon KDP. Diseña una estrategia de lanzamiento concisa y efectiva para un libro de colorear disponible en Amazon KDP. El libro está dirigido a turistas extranjeros que visitan México y se centra en la cultura mexicana, específicamente comida y Xochimilco, incluyendo frases locales con traducción y pronunciación. Tu estrategia debe: * Enfocarse explícitamente en el público objetivo de turistas que visitan México. * Sugerir tácticas de marketing digital y canales de promoción relevantes. * Proponer 3 etiquetas (keywords) clave para Amazon KDP que atraigan al público objetivo. * Utilizar un lenguaje claro y no demasiado técnico. La respuesta debe tener un máximo de 300 palabras.",
//    "explanation":"El prompt ha sido optimizado para `gemini-2.5-flash` mediante las siguientes acciones: \n1.  **Definición de Rol Clara**: Se establece el rol de 'Experto en Marketing Digital y Ventas en Amazon KDP' al inicio para enfocar la respuesta del modelo.\n2.  **Tarea Directa y Concisa**: La tarea principal de 'diseñar una estrategia de lanzamiento' se presenta de forma directa, pidiendo concisión.\n3.  **Contexto Integrado**: Los detalles del libro (público objetivo, contenido específico sobre cultura mexicana, frases locales) se integran fluidamente para dar al modelo toda la información necesaria para una estrategia relevante.\n4.  **Restricciones Convertidas en Requisitos Explícitos**: Las restricciones originales se transforman en puntos específicos que la estrategia debe cumplir (enfocarse en turistas, no usar lenguaje técnico, sugerir 3 etiquetas).\n5.  **Formato Estructurado**: El uso de viñetas para los requisitos de la estrategia mejora la claridad y asegura que el modelo cubra todos los puntos solicitados de manera explícita.\n6.  **Límite de Palabras**: Se incluye un límite de 300 palabras para garantizar una respuesta concisa y directa, ideal para modelos flash.\n7.  **'questions_for_ai' Implícito**: Al hacer que el prompt sea tan detallado y específico en sus requisitos, se anticipan posibles preguntas, permitiendo que el modelo genere una respuesta completa sin necesidad de solicitar información adicional."
// }