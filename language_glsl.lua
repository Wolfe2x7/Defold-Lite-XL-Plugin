-- mod-version:3

local style = require "core.style"
local common = require "core.common"

local syntax = require "core.syntax"

syntax.add {
  name = "GLSL",
  files = { "%.glsl$", "%.frag$", "%.vert$", "%.fp$", "%.vp$", },
  comment = "//",
  patterns = {
    { pattern = "//.-\n",               type = "comment"  },
    { pattern = { "/%*", "%*/" },       type = "comment"  },
    { pattern = { "#", "[^\\]\n" },     type = "comment"  },
    { pattern = { '"', '"', '\\' },     type = "string"   },
    { pattern = { "'", "'", '\\' },     type = "string"   },
    { pattern = "-?0x%x+",              type = "number"   },
    { pattern = "-?%d+[%d%.eE]*f?",     type = "number"   },
    { pattern = "-?%.?%d+f?",           type = "number"   },
    { pattern = "[%+%-=/%*%^%%<>!~|&]", type = "operator" },

    { pattern = "ivec[2-4]",            type = "keyword2" },
    { pattern = "bvec[2-4]",            type = "keyword2" },
    { pattern = "uvec[2-4]",            type = "keyword2" },
    { pattern = "vec[2-4]",             type = "keyword2" },
    { pattern = "dmat[2-4]x[2-4]",      type = "keyword2" },
    { pattern = "dmat[2-4]",            type = "keyword2" },
    { pattern = "mat[2-4]x[2-4]",       type = "keyword2" },
    { pattern = "mat[2-4]",             type = "keyword2" },

    { pattern = "[%a_][%w_]*%f[(]",     type = "function" },
    { pattern = "[%a_][%w_]*",          type = "symbol"   },
  },
  symbols = {
    --https://www.khronos.org/registry/OpenGL/specs/gl/GLSLangSpec.4.60.pdf
    --The symbols are added here in the order they appear in the spec
    ["if"]       = "keyword",
    ["else"]     = "keyword",
    ["do"]       = "keyword",
    ["while"]    = "keyword",
    ["for"]      = "keyword",
    ["break"]    = "keyword",
    ["continue"] = "keyword",
    ["return"]   = "keyword",
    ["const"]    = "keyword",
    ["switch"]   = "keyword",
    ["case"]     = "keyword",
    ["default"]  = "keyword",
    ["const"]    = "keyword",
    ["void"]     = "keyword",
    ["bool"]     = "keyword2",
    ["int"]      = "keyword2",
    ["uint"]     = "keyword2",
    ["float"]    = "keyword2",
    ["double"]   = "keyword2",
    ["true"]     = "literal",
    ["false"]    = "literal",
    ["NULL"]     = "literal",

    ["attribute"]    = "keyword",
    ["varying"]      = "keyword",
    ["uniform"]      = "keyword",
    ["buffer"]       = "keyword",
    ["shared"]       = "keyword",
    ["layout"]       = "keyword",
    ["centroid"]     = "keyword",
    ["flat"]         = "keyword",
    ["smooth"]       = "keyword",
    ["noperspective"]= "keyword",
    ["patch"]        = "keyword",
    ["sample"]       = "keyword",
    ["in"]           = "keyword",
    ["out"]          = "keyword",
    ["inout"]        = "keyword",
    ["invariant"]    = "keyword",
    ["precise"]      = "keyword",
    ["lowp"]         = "keyword",
    ["mediump"]      = "keyword",
    ["highp"]        = "keyword",
    ["precision"]    = "keyword",
    ["struct"]       = "keyword",
    ["subroutine"]   = "keyword",

    ["coherent"]       = "keyword",
    ["volatile"]       = "keyword",
    ["readonly"]       = "keyword",
    ["writeonly"]      = "keyword",

    ["sampler1D"]             = "keyword2",
    ["sampler2D"]             = "keyword2",
    ["sampler3D"]             = "keyword2",
    ["samplerCube"]           = "keyword2",
    ["sampler1DShadow"]       = "keyword2",
    ["sampler2DShadow"]       = "keyword2",
    ["samplerCubeShadow"]     = "keyword2",
    ["sampler1DArray"]        = "keyword2",
    ["sampler2DArray"]        = "keyword2",
    ["samplerCubeArray"]      = "keyword2",
    ["sampler1DArrayShadow"]  = "keyword2",
    ["sampler2DArrayShadow"]  = "keyword2",
    ["samplerCubeArrayShadow"]= "keyword2",
    ["isampler1D"]            = "keyword2",
    ["isampler2D"]            = "keyword2",
    ["isampler3D"]            = "keyword2",
    ["isamplerCube"]          = "keyword2",
    ["sampler2DMS"]           = "keyword2",
    ["isampler2DMS"]          = "keyword2",
    ["usampler2DMS"]          = "keyword2",
    ["sampler2DMSArray"]      = "keyword2",
    ["isampler2DMSArray"]     = "keyword2",
    ["usampler2DMSArray"]     = "keyword2",
    ["isampler1DArray"]       = "keyword2",
    ["isampler2DArray"]       = "keyword2",
    ["usampler1D"]            = "keyword2",
    ["usampler2D"]            = "keyword2",
    ["usampler3D"]            = "keyword2",
    ["usamplerCube"]          = "keyword2",
    ["usampler1DArray"]       = "keyword2",
    ["usampler2DArray"]       = "keyword2",
    ["sampler2DRect"]         = "keyword2",
    ["sampler2DRectShadow"]   = "keyword2",
    ["isampler2DRect"]        = "keyword2",
    ["usampler2DRect"]        = "keyword2",
    ["samplerBuffer"]         = "keyword2",
    ["isamplerBuffer"]        = "keyword2",
    ["usamplerBuffer"]        = "keyword2",

    ["image1D"]        = "keyword2",
    ["iimage1D"]       = "keyword2",
    ["uimage1D"]       = "keyword2",
    ["image1DArray"]   = "keyword2",
    ["iimage1DArray"]  = "keyword2",
    ["uimage1DArray"]  = "keyword2",
    ["image2D"]        = "keyword2",
    ["iimage2D"]       = "keyword2",
    ["uimage2D"]       = "keyword2",
    ["image2DArray"]   = "keyword2",
    ["iimage2DArray"]  = "keyword2",
    ["uimage2DArray"]  = "keyword2",
    ["image2DRect"]    = "keyword2",
    ["iimage2DRect"]   = "keyword2",
    ["uimage2DRect"]   = "keyword2",
    ["image2DMS"]      = "keyword2",
    ["iimage2DMS"]     = "keyword2",
    ["uimage2DMS"]     = "keyword2",
    ["image2DMSArray"] = "keyword2",
    ["iimage2DMSArray"]= "keyword2",
    ["uimage2DMSArray"]= "keyword2",
    ["image3D"]        = "keyword2",
    ["iimage3D"]       = "keyword2",
    ["uimage3D"]       = "keyword2",
    ["imageCube"]      = "keyword2",
    ["iimageCube"]     = "keyword2",
    ["uimageCube"]     = "keyword2",
    ["imageCubeArray"] = "keyword2",
    ["iimageCubeArray"]= "keyword2",
    ["uimageCubeArray"]= "keyword2",
    ["imageBuffer"]    = "keyword2",
    ["iimageBuffer"]   = "keyword2",
    ["uimageBuffer"]   = "keyword2",

    ["atomic_uint"]    = "keyword2",

    ["radians"]              = "keyword",
    ["degrees"]              = "keyword",
    ["sin"]                  = "keyword",
    ["cos"]                  = "keyword",
    ["tan"]                  = "keyword",
    ["asin"]                 = "keyword",
    ["acos"]                 = "keyword",
    ["atan"]                 = "keyword",
    ["sinh"]                 = "keyword",
    ["cosh"]                 = "keyword",
    ["tanh"]                 = "keyword",
    ["asinh"]                = "keyword",
    ["acosh"]                = "keyword",
    ["pow"]                  = "keyword",
    ["exp"]                  = "keyword",
    ["exp2"]                 = "keyword",
    ["log2"]                 = "keyword",
    ["sqrt"]                 = "keyword",
    ["inversesqrt"]          = "keyword",
    ["abs"]                  = "keyword",
    ["sign"]                 = "keyword",
    ["floor"]                = "keyword",
    ["trunc"]                = "keyword",
    ["round"]                = "keyword",
    ["roundEven"]            = "keyword",
    ["ceil"]                 = "keyword",
    ["fract"]                = "keyword",
    ["mod"]                  = "keyword",
    ["modf"]                 = "keyword",
    ["min"]                  = "keyword",
    ["max"]                  = "keyword",
    ["clamp"]                = "keyword",
    ["mix"]                  = "keyword",
    ["step"]                 = "keyword",
    ["smoothstep"]           = "keyword",
    ["isnan"]                = "keyword",
    ["isinf"]                = "keyword",
    ["floatBitsToInt"]       = "keyword",
    ["floatBitsToUint"]      = "keyword",
    ["intBitsToFloat"]       = "keyword",
    ["uintBitsToFloat"]      = "keyword",
    ["fma"]                  = "keyword",
    ["frexp"]                = "keyword",
    ["ldexp"]                = "keyword",
    ["packUnorm2x16"]        = "keyword",
    ["packSnorm2x16"]        = "keyword",
    ["packUnorm4x8"]         = "keyword",
    ["packSnorm4x8"]         = "keyword",
    ["unpackUnorm2x16"]      = "keyword",
    ["unpackSnorm2x16"]      = "keyword",
    ["unpackUnorm4x8"]       = "keyword",
    ["unpackSnorm4x8"]       = "keyword",
    ["packHalf2x16"]         = "keyword",
    ["unpackHalf2x16"]       = "keyword",
    ["packDouble2x32"]       = "keyword",
    ["unpackDouble2x32"]     = "keyword",
    ["length"]               = "keyword",
    ["distance"]             = "keyword",
    ["dot"]                  = "keyword",
    ["cross"]                = "keyword",
    ["normalize"]            = "keyword",
    ["ftransform"]           = "keyword",
    ["faceforward"]          = "keyword",
    ["reflect"]              = "keyword",
    ["refract"]              = "keyword",
    ["matrixCompMult"]       = "keyword",
    ["outerProduct"]         = "keyword",
    ["transpose"]            = "keyword",
    ["determinant"]          = "keyword",
    ["inverse"]              = "keyword",
    ["lessThan"]             = "keyword",
    ["lessThanEqual"]        = "keyword",
    ["greaterThan"]          = "keyword",
    ["greaterThanEqual"]     = "keyword",
    ["equal"]                = "keyword",
    ["notEqual"]             = "keyword",
    ["any"]                  = "keyword",
    ["all"]                  = "keyword",
    ["not"]                  = "keyword",
    ["uaddCarry"]            = "keyword",
    ["usubBorrow"]           = "keyword",
    ["umulExtended"]         = "keyword",
    ["imulExtended"]         = "keyword",
    ["bitfieldExtract"]      = "keyword",
    ["bitfieldInsert"]       = "keyword",
    ["bitfieldReverse"]      = "keyword",
    ["bitCount"]             = "keyword",
    ["findLSB"]              = "keyword",
    ["findMSB"]              = "keyword",
    ["textureSize"]          = "keyword",
    ["textureQueryLod"]      = "keyword",
    ["textureQueryLevels"]   = "keyword",
    ["textureSamples"]       = "keyword",
    ["texture"]              = "keyword",
    ["textureProj"]          = "keyword",
    ["textureLod"]           = "keyword",
    ["textureOffset"]        = "keyword",
    ["texelFetch"]           = "keyword",
    ["texelFetchOffset"]     = "keyword",
    ["textureProjOffset"]    = "keyword",
    ["textureLodOffset"]     = "keyword",
    ["textureProjLod"]       = "keyword",
    ["textureProjLodOffset"] = "keyword",
    ["textureGrad"]          = "keyword",
    ["textureGradOffset"]    = "keyword",
    ["textureProjGrad"]      = "keyword",
    ["textureProjGradOffset"]= "keyword",
    ["textureGather"]        = "keyword",
    ["textureGatherOffset"]  = "keyword",
    ["textureGatherOffsets"] = "keyword",

    --Atomic Counter Functions
    ["atomicCounterIncrement"]= "keyword",
    ["atomicCounterDecrement"]= "keyword",
    ["atomicCounter"]         = "keyword",
    ["atomicCounterAdd"]      = "keyword",
    ["atomicCounterSubtract"] = "keyword",
    ["atomicCounterMin"]      = "keyword",
    ["atomicCounterMax"]      = "keyword",
    ["atomicCounterAnd"]      = "keyword",
    ["atomicCounterOr"]       = "keyword",
    ["atomicCounterXor"]      = "keyword",
    ["atomicCounterExchange"] = "keyword",
    ["atomicCounterCompSwap"] = "keyword",
    --Atomic Memory Functions
    ["atomicAdd"]     = "keyword",
    ["atomicMin"]     = "keyword",
    ["atomicMax"]     = "keyword",
    ["atomicAnd"]     = "keyword",
    ["atomicOr"]      = "keyword",
    ["atomicXor"]     = "keyword",
    ["atomicExchange"]= "keyword",
    ["atomicCompSwap"]= "keyword",
    --Image Functions
    ["imageSize"]          = "keyword",
    ["imageSamples"]       = "keyword",
    ["imageLoad"]          = "keyword",
    ["imageStore"]         = "keyword",
    ["imageAtomicAdd"]     = "keyword",
    ["imageAtomicMin"]     = "keyword",
    ["imageAtomicMax"]     = "keyword",
    ["imageAtomicAnd"]     = "keyword",
    ["imageAtomicOr"]      = "keyword",
    ["imageAtomicXor"]     = "keyword",
    ["imageAtomicExchange"]= "keyword",
    ["imageAtomicCompSwap"]= "keyword",
    --Geometry Shader Functions
    ["EmitStreamVertex"]   = "keyword",
    ["EndStreamPrimitive"] = "keyword",
    ["EmitVertex"]         = "keyword",
    ["EndPrimitive"]       = "keyword",
    --Fragment Processing Functions
    ["dFdx"]                 = "keyword",
    ["dFdy"]                 = "keyword",
    ["dFdxFine"]             = "keyword",
    ["dFdyFine"]             = "keyword",
    ["dFdxCoarse"]           = "keyword",
    ["dFdyCoarse"]           = "keyword",
    ["fwidth"]               = "keyword",
    ["fwidthFine"]           = "keyword",
    ["fwidthCoarse"]         = "keyword",
    ["interpolateAtCentroid"]= "keyword",
    ["interpolateAtSample"]  = "keyword",
    ["interpolateAtOffset"]  = "keyword",
    --Shader Invocation Control Functions
    ["barrier"]    = "keyword",
    --Shader Memory Control Functions
    ["memoryBarrier"]             = "keyword",
    ["memoryBarrierAtomicCounter"]= "keyword",
    ["memoryBarrierBuffer"]       = "keyword",
    ["memoryBarrierShared"]       = "keyword",
    ["memoryBarrierImage"]        = "keyword",
    ["groupMemoryBarrier"]        = "keyword",
    --Subpass-Input Functions
    ["subpassLoad"]        = "keyword",
    --Shader Invocation Group Functions
    ["anyInvocation"]      = "keyword",
    ["allInvocations"]     = "keyword",
    ["allInvocationsEqual"]= "keyword",

    --"In addition, when targeting Vulkan, the following keywords also exist:"
    ["texture1D"]        = "keyword",
    ["texture1DArray"]   = "keyword",
    ["itexture1D"]       = "keyword",
    ["itexture1DArray"]  = "keyword",
    ["utexture1D"]       = "keyword",
    ["utexture1DArray"]  = "keyword",
    ["texture2D"]        = "keyword",
    ["texture2DArray"]   = "keyword",
    ["itexture2D"]       = "keyword",
    ["itexture2DArray"]  = "keyword",
    ["utexture2D"]       = "keyword",
    ["utexture2DArray"]  = "keyword",
    ["texture2DRect"]    = "keyword",
    ["itexture2DRect"]   = "keyword",
    ["utexture2DRect"]   = "keyword",
    ["texture2DMS"]      = "keyword",
    ["itexture2DMS"]     = "keyword",
    ["utexture2DMS"]     = "keyword",
    ["texture2DMSArray"] = "keyword",
    ["itexture2DMSArray"]= "keyword",
    ["utexture2DMSArray"]= "keyword",
    ["texture3D"]        = "keyword",
    ["itexture3D"]       = "keyword",
    ["utexture3D"]       = "keyword",
    ["textureCube"]      = "keyword",
    ["itextureCube"]     = "keyword",
    ["utextureCube"]     = "keyword",
    ["textureCubeArray"] = "keyword",
    ["itextureCubeArray"]= "keyword",
    ["utextureCubeArray"]= "keyword",
    ["textureBuffer"]    = "keyword",
    ["itextureBuffer"]   = "keyword",
    ["utextureBuffer"]   = "keyword",
    ["sampler"]          = "keyword2",
    ["samplerShadow"]    = "keyword2",
    ["subpassInput"]     = "keyword2",
    ["isubpassInput"]    = "keyword2",
    ["usubpassInput"]    = "keyword2",
    ["subpassInputMS"]   = "keyword2",
    ["isubpassInputMS"]  = "keyword2",
    ["usubpassInputMS"]  = "keyword2",
  },
}

